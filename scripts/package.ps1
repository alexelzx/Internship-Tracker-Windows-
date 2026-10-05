$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$tempOutput = Join-Path $env:TEMP 'stage-release'
$projectOutput = Join-Path $root 'release-final'

if (Test-Path $tempOutput) {
  Remove-Item $tempOutput -Recurse -Force -ErrorAction SilentlyContinue
}

Push-Location $root
try {
  & npx electron-builder --win nsis portable --config.directories.output="$tempOutput"
  if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
  }
} finally {
  Pop-Location
}

New-Item -ItemType Directory -Path $projectOutput -Force | Out-Null
Get-ChildItem $tempOutput -Filter 'Stage-*.exe' | Copy-Item -Destination $projectOutput -Force
Get-ChildItem $tempOutput -Filter '*.blockmap' | Copy-Item -Destination $projectOutput -Force
Copy-Item (Join-Path $tempOutput 'builder-effective-config.yaml') -Destination $projectOutput -Force
Write-Host "Packages copied to $projectOutput"
