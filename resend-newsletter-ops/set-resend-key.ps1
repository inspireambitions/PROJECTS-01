$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$envPath = Join-Path $root ".env"
$secure = Read-Host "Paste Resend API key. It will not display" -AsSecureString
$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
try {
    $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
    if (-not $plain.StartsWith("re_")) {
        throw "That does not look like a Resend API key. Expected it to start with re_."
    }
    @(
        "RESEND_API_KEY=$plain"
        "RESEND_API_BASE=https://api.resend.com"
    ) | Set-Content -LiteralPath $envPath -Encoding UTF8
    Write-Host "Saved .env for local Claude Code and Codex use. Do not commit this file."
}
finally {
    if ($bstr -ne [IntPtr]::Zero) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
    }
}
