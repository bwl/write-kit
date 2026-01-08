#!/usr/bin/env pwsh
# Setup story outline for a story

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output "Usage: ./setup-outline.ps1 [-Json] [-Help]"
    Write-Output "  -Json     Output results in JSON format"
    Write-Output "  -Help     Show this help message"
    exit 0
}

# Load common functions
. "$PSScriptRoot/common.ps1"

# Get all paths and variables from common functions
$paths = Get-NovelPathsEnv

# Check if we're on a proper story branch (only for git repos)
if (-not (Test-NovelBranch -Branch $paths.CURRENT_BRANCH -HasGit $paths.HAS_GIT)) {
    exit 1
}

# Ensure the novel directory exists
New-Item -ItemType Directory -Path $paths.NOVEL_DIR -Force | Out-Null

# Copy outline template if it exists, otherwise note it or create empty file
$template = Join-Path $paths.REPO_ROOT 'templates/outline-template.md'
if (Test-Path $template) {
    Copy-Item $template $paths.IMPL_PLAN -Force
    Write-Output "Copied outline template to $($paths.IMPL_PLAN)"
} else {
    Write-Warning "Outline template not found at $template"
    # Create a basic outline file if template doesn't exist
    New-Item -ItemType File -Path $paths.IMPL_PLAN -Force | Out-Null
}

# Output results (using story-specific variable names)
if ($Json) {
    $result = [PSCustomObject]@{
        STORY_SPEC = $paths.NOVEL_PREMISE
        STORY_OUTLINE = $paths.IMPL_PLAN
        SPECS_DIR = $paths.NOVEL_DIR
        BRANCH = $paths.CURRENT_BRANCH
        HAS_GIT = $paths.HAS_GIT
    }
    $result | ConvertTo-Json -Compress
} else {
    Write-Output "STORY_SPEC: $($paths.NOVEL_PREMISE)"
    Write-Output "STORY_OUTLINE: $($paths.IMPL_PLAN)"
    Write-Output "SPECS_DIR: $($paths.NOVEL_DIR)"
    Write-Output "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Output "HAS_GIT: $($paths.HAS_GIT)"
}