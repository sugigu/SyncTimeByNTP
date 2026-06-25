# RandomNtpAndSync.ps1
# Run as Administrator

$servers = @(
    "time.stdtime.gov.tw",
    "time.google.com",
    "time.cloudflare.com"
)

$server = Get-Random -InputObject $servers

Write-Host "Selected NTP: $server"

Set-Service w32time -StartupType Automatic
Start-Service w32time -ErrorAction SilentlyContinue

w32tm /config /manualpeerlist:"$server,0x8" /syncfromflags:manual /reliable:no /update
Restart-Service w32time
w32tm /resync /force
w32tm /query /status