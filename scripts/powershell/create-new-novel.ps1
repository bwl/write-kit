#!/usr/bin/env pwsh
# Create a new novel
[CmdletBinding()]
param(
    [switch]$Json,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$NovelDescription
)
$ErrorActionPreference = 'Stop'

if (-not $NovelDescription -or $NovelDescription.Count -eq 0) {
    Write-Error "Usage: ./create-new-novel.ps1 [-Json] <novel description>"
    exit 1
}
$novelDesc = ($NovelDescription -join ' ').Trim()

# Resolve repository root. Prefer git information when available, but fall back
# to searching for repository markers so the workflow still functions in repositories that
# were initialised with --no-git.
function Find-RepositoryRoot {
    param(
        [string]$StartDir,
        [string[]]$Markers = @('.git', '.writekit')
    )
    $current = Resolve-Path $StartDir
    while ($true) {
        foreach ($marker in $Markers) {
            if (Test-Path (Join-Path $current $marker)) {
                return $current
            }
        }
        $parent = Split-Path $current -Parent
        if ($parent -eq $current) {
            # Reached filesystem root without finding markers
            return $null
        }
        $current = $parent
    }
}
$fallbackRoot = (Find-RepositoryRoot -StartDir $PSScriptRoot)
if (-not $fallbackRoot) {
    Write-Error "Error: Could not determine repository root. Please run this script from within the repository."
    exit 1
}

try {
    $repoRoot = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0) {
        $hasGit = $true
    } else {
        throw "Git not available"
    }
} catch {
    $repoRoot = $fallbackRoot
    $hasGit = $false
}

Set-Location $repoRoot

$novelsDir = Join-Path $repoRoot 'novels'
New-Item -ItemType Directory -Path $novelsDir -Force | Out-Null

$highest = 0
if (Test-Path $novelsDir) {
    Get-ChildItem -Path $novelsDir -Directory | ForEach-Object {
        if ($_.Name -match '^(\d{3})') {
            $num = [int]$matches[1]
            if ($num -gt $highest) { $highest = $num }
        }
    }
}
$next = $highest + 1
$novelNum = ('{0:000}' -f $next)

$branchName = $novelDesc.ToLower() -replace '[^a-z0-9]', '-' -replace '-{2,}', '-' -replace '^-', '' -replace '-$', ''
$words = ($branchName -split '-') | Where-Object { $_ } | Select-Object -First 3
$branchName = "$novelNum-$([string]::Join('-', $words))"

if ($hasGit) {
    try {
        git checkout -b $branchName | Out-Null
    } catch {
        Write-Warning "Failed to create git branch: $branchName"
    }
} else {
    Write-Warning "[writekit] Warning: Git repository not detected; skipped branch creation for $branchName"
}

$novelDir = Join-Path $novelsDir $branchName
New-Item -ItemType Directory -Path $novelDir -Force | Out-Null

$template = Join-Path $repoRoot '.writekit/templates/premise-template.md'
$premiseFile = Join-Path $novelDir 'premise.md'
if (Test-Path $template) {
    Copy-Item $template $premiseFile -Force
} else {
    New-Item -ItemType File -Path $premiseFile | Out-Null
}

# Create novel structure directories
New-Item -ItemType Directory -Path (Join-Path $novelDir 'characters') -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $novelDir 'chapters') -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $novelDir 'outline') -Force | Out-Null

# Set the WRITEKIT_NOVEL environment variable for the current session
$env:WRITEKIT_NOVEL = $branchName

if ($Json) {
    $obj = [PSCustomObject]@{
        BRANCH_NAME = $branchName
        PREMISE_FILE = $premiseFile
        NOVEL_NUM = $novelNum
        HAS_GIT = $hasGit
    }
    $obj | ConvertTo-Json -Compress
} else {
    Write-Output "BRANCH_NAME: $branchName"
    Write-Output "PREMISE_FILE: $premiseFile"
    Write-Output "NOVEL_NUM: $novelNum"
    Write-Output "HAS_GIT: $hasGit"
    Write-Output "WRITEKIT_NOVEL environment variable set to: $branchName"
}
