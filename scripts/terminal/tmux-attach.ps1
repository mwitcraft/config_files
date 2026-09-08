<#
.SYNOPSIS
    Interactively list and attach to active tmux sessions.
#>

# Ensure tmux is available in current environment
if (-not (Get-Command "tmux" -ErrorAction SilentlyContinue)) {
    Write-Error "tmux is not installed or not found in PATH."
    exit 1
}

# Fetch running tmux sessions (Format: "session_name: X windows (created ...)")
$sessions = tmux list-sessions 2>$null

if (-not $sessions) {
    Write-Host "No active tmux sessions found." -ForegroundColor Yellow
    exit 0
}

# Parse session names
$sessionList = @()
foreach ($line in $sessions) {
    $name = ($line -split ':')[0]
    $sessionList += [PSCustomObject]@{
        Name    = $name
        Details = $line
    }
}

# Selection via Out-GridView if available, otherwise fallback to console menu
$selectedName = $null

Write-Host "`n--- Active tmux Sessions ---" -ForegroundColor Cyan
for ($i = 0; $i -lt $sessionList.Count; $i++) {
    Write-Host " [$($i + 1)] $($sessionList[$i].Details)"
}

$choice = Read-Host "`nEnter number to attach (or Press Enter to exit)"
if ($choice -match '^\d+$' -and [int]$choice -ge 1 -and [int]$choice -le $sessionList.Count) {
    $selectedName = $sessionList[[int]$choice - 1].Name
}

# Attach to selected session
if ($selectedName) {
    Write-Host "Attaching to session '$selectedName'..." -ForegroundColor Green
    tmux attach-session -t $selectedName
} else {
    Write-Host "No session selected. Exiting." -ForegroundColor Yellow
}