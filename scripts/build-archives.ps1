$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$workshopRoot = Join-Path $repositoryRoot 'workshops/ai-agent-room-booking'
$outputRoot = Join-Path $repositoryRoot 'dist'

foreach ($file in (Get-ChildItem -LiteralPath $workshopRoot -Recurse -Filter '*.json')) {
    $content = Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json
    if (-not $content.templateId -or -not $content.sections -or $content.metadata.license -ne 'CC-BY-SA 4.0') {
        throw "Invalid canvas content: $($file.Name)"
    }
}

New-Item -ItemType Directory -Path $outputRoot -Force | Out-Null
$participantZip = Join-Path $outputRoot 'ai-agent-room-booking-participants.zip'
$completeZip = Join-Path $outputRoot 'ai-agent-room-booking-complete.zip'
$licensePath = Join-Path $repositoryRoot 'LICENSE.md'
Compress-Archive -Path (Join-Path $workshopRoot 'participants/*'),$licensePath -DestinationPath $participantZip -Force
Compress-Archive -Path (Join-Path $workshopRoot 'participants'),(Join-Path $workshopRoot 'facilitator'),(Join-Path $workshopRoot 'README.md'),$licensePath -DestinationPath $completeZip -Force

Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($file in @($participantZip, $completeZip)) {
    $archive = [System.IO.Compression.ZipFile]::OpenRead($file)
    try {
        Write-Output "$([System.IO.Path]::GetFileName($file)): $($archive.Entries.Count) files"
    } finally {
        $archive.Dispose()
    }
}
