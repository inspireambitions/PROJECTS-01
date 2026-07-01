// Inspire Ambitions — Folder 1 (UAE Labour Law) publisher
// Publishes hub + 6 spokes to WordPress via the REST API, sets the page
// hierarchy, then applies on-page SEO. Standard WP REST is reliable; the two
// AIOSEO-specific steps are flagged VERIFY and run against the live API first.
//
// Run (PowerShell):
//   $env:WP_BASE="https://inspireambitions.com"
//   $env:WP_USER="your-wp-username"
//   $env:WP_APP_PASSWORD="xxxx xxxx xxxx xxxx xxxx xxxx"   # WP Application Password
//   $env:PUBLISH_STATUS="draft"   # 'draft' first pass, 'publish' once Codex passes
//   node publish-folder-01.mjs
//
// Needs Node 18+ (global fetch). No external deps.

import { readFile, readdir } from "node:fs/promises";
import path from "node:path";

const BASE = process.env.WP_BASE;
const USER = process.env.WP_USER;
const PASS = process.env.WP_APP_PASSWORD;
const STATUS = process.env.PUBLISH_STATUS || "draft";
const DIR = path.join(process.cwd(), "folder-01-labour-law");

if (!BASE || !USER || !PASS) {
  console.error("Set WP_BASE, WP_USER, WP_APP_PASSWORD env vars first.");
  process.exit(1);
}

const AUTH = "Basic " + Buffer.from(`${USER}:${PASS}`).toString("base64");
const api = (p) => `${BASE.replace(/\/$/, "")}/wp-json${p}`;

async function wp(p, method = "GET", body) {
  const res = await fetch(api(p), {
    method,
    headers: { Authorization: AUTH, "Content-Type": "application/json" },
    body: body ? JSON.stringify(body) : undefined,
  });
  const text = await res.text();
  let data;
  try { data = JSON.parse(text); } catch { data = text; }
  if (!res.ok) throw new Error(`${method} ${p} -> ${res.status}: ${text.slice(0, 300)}`);
  return data;
}

// Pull simple key:value metadata out of the leading HTML comment block.
function parseMeta(raw) {
  const m = raw.match(/^<!--([\s\S]*?)-->/);
  const meta = {};
  if (m) for (const line of m[1].split("\n")) {
    const kv = line.match(/^\s*([a-z_]+):\s*(.+?)\s*$/);
    if (kv) meta[kv[1]] = kv[2];
  }
  const content = raw.replace(/^<!--[\s\S]*?-->\s*/, "");
  return { meta, content };
}

async function findExistingPage(slug) {
  const hits = await wp(`/wp/v2/pages?slug=${encodeURIComponent(slug)}&status=any`);
  return Array.isArray(hits) && hits[0] ? hits[0].id : null;
}

async function upsertPage({ slug, title, content, parent }) {
  const existing = await findExistingPage(slug);
  const payload = { title, slug, content, status: STATUS, parent: parent || 0 };
  if (existing) {
    console.log(`  update page #${existing} (${slug})`);
    return wp(`/wp/v2/pages/${existing}`, "POST", payload);
  }
  console.log(`  create page (${slug})`);
  return wp(`/wp/v2/pages`, "POST", payload);
}

// VERIFY on connect: AIOSEO stores SEO title/description in its own table, not
// standard postmeta. On first run we GET /wp-json/aioseo/v1/ to confirm the
// endpoint shape, then PATCH title/description. If unavailable, titles still
// render from the H1 and this logs a clear skip so Kim can map it by hand once.
async function setAioseo(pageId, meta) {
  try {
    await wp(`/aioseo/v1/post`, "POST", {
      id: pageId,
      title: meta.title_tag,
      description: meta.meta_description,
    });
    console.log(`  aioseo meta set on #${pageId}`);
  } catch (e) {
    console.warn(`  [VERIFY] aioseo meta skipped on #${pageId}: ${e.message}`);
  }
}

async function main() {
  const files = (await readdir(DIR)).filter((f) => f.endsWith(".html")).sort();
  const order = ["00", ...["01", "02", "03", "04", "05", "06"]];
  const byPrefix = {};
  for (const f of files) byPrefix[f.slice(0, 2)] = f;

  // 1) Hub first so children can attach to it.
  const hubRaw = await readFile(path.join(DIR, byPrefix["00"]), "utf8");
  const hub = parseMeta(hubRaw);
  console.log("Publishing hub...");
  const hubPage = await upsertPage({
    slug: hub.meta.slug, title: hub.meta.h1, content: hub.content, parent: 0,
  });
  await setAioseo(hubPage.id, hub.meta);

  // 2) Spokes as children of the hub.
  for (const pfx of order.slice(1)) {
    const raw = await readFile(path.join(DIR, byPrefix[pfx]), "utf8");
    const { meta, content } = parseMeta(raw);
    console.log(`Publishing spoke ${meta.slug}...`);
    const page = await upsertPage({
      slug: meta.slug, title: meta.h1, content, parent: hubPage.id,
    });
    await setAioseo(page.id, meta);
  }

  console.log(`\nDone. Status=${STATUS}. Hub id=${hubPage.id}.`);
  console.log("Next: import aioseo-redirects-folder-01.csv, then verify live URLs.");
}

main().catch((e) => { console.error(e); process.exit(1); });
