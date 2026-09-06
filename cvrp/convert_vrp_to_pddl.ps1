param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$FolderPath
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

$folder = (Resolve-Path -LiteralPath $FolderPath).Path
$inputFiles = Get-ChildItem -LiteralPath $folder -Filter "*.vrp"

if ($inputFiles.Count -eq 0) {
    throw "No .vrp files found in: $folder"
}

foreach ($inputFile in $inputFiles) {
    $outputPath = Join-Path $folder "$($inputFile.BaseName).pddl"
    $problemPddl = Join-Path $ScriptDir "problem.pddl"

    Write-Host "Processing: $($inputFile.FullName)"
    uv run python cvrp_to_pddl.py $inputFile.FullName

    if (-not (Test-Path -LiteralPath $problemPddl)) {
        throw "problem.pddl was not generated for: $($inputFile.FullName)"
    }

    Move-Item -LiteralPath $problemPddl -Destination $outputPath -Force
    Write-Host "Created: $outputPath"
}
