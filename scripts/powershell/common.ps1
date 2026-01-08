#!/usr/bin/env pwsh
# Common PowerShell functions analogous to common.sh

function Get-RepoRoot {
    try {
        $result = git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # Fall back to script location for non-git repos
    return (Resolve-Path (Join-Path $PSScriptRoot "../../..")).Path
}

function Get-CurrentBranch {
    # First check if WRITEKIT_NOVEL environment variable is set
    if ($env:WRITEKIT_NOVEL) {
        return $env:WRITEKIT_NOVEL
    }
    
    # Then check git if available
    try {
        $result = git rev-parse --abbrev-ref HEAD 2>$null
        if ($LASTEXITCODE -eq 0) {
            return $result
        }
    } catch {
        # Git command failed
    }
    
    # For non-git repos, try to find the latest novel directory
    $repoRoot = Get-RepoRoot
    $novelsDir = Join-Path $repoRoot "novels"

    if (Test-Path $novelsDir) {
        $latestNovel = ""
        $highest = 0

        Get-ChildItem -Path $novelsDir -Directory | ForEach-Object {
            if ($_.Name -match '^(\d{3})-') {
                $num = [int]$matches[1]
                if ($num -gt $highest) {
                    $highest = $num
                    $latestNovel = $_.Name
                }
            }
        }
        
        if ($latestNovel) {
            return $latestNovel
        }
    }
    
    # Final fallback
    return "main"
}

function Test-HasGit {
    try {
        git rev-parse --show-toplevel 2>$null | Out-Null
        return ($LASTEXITCODE -eq 0)
    } catch {
        return $false
    }
}

function Test-NovelBranch {
    param(
        [string]$Branch,
        [bool]$HasGit = $true
    )

    # For non-git repos, we can't enforce branch naming but still provide output
    if (-not $HasGit) {
        Write-Warning "[writekit] Warning: Git repository not detected; skipped branch validation"
        return $true
    }

    if ($Branch -notmatch '^[0-9]{3}-') {
        Write-Output "ERROR: Not on a novel branch. Current branch: $Branch"
        Write-Output "Novel branches should be named like: 001-novel-name"
        return $false
    }
    return $true
}

function Get-NovelDir {
    param([string]$RepoRoot, [string]$Branch)
    Join-Path $RepoRoot "novels/$Branch"
}

function Get-NovelPathsEnv {
    $repoRoot = Get-RepoRoot
    $currentBranch = Get-CurrentBranch
    $hasGit = Test-HasGit
    $novelDir = Get-NovelDir -RepoRoot $repoRoot -Branch $currentBranch

    [PSCustomObject]@{
        REPO_ROOT     = $repoRoot
        CURRENT_BRANCH = $currentBranch
        HAS_GIT       = $hasGit
        NOVEL_DIR     = $novelDir
        NOVEL_PREMISE = Join-Path $novelDir 'premise.md'
        IMPL_PLAN     = Join-Path $novelDir 'plan.md'
        TASKS         = Join-Path $novelDir 'tasks.md'
        RESEARCH      = Join-Path $novelDir 'research.md'
        DATA_MODEL    = Join-Path $novelDir 'data-model.md'
        QUICKSTART    = Join-Path $novelDir 'quickstart.md'
        CONTRACTS_DIR = Join-Path $novelDir 'contracts'
        CHARACTERS_DIR = Join-Path $novelDir 'characters'
        CHAPTERS_DIR  = Join-Path $novelDir 'chapters'
        OUTLINE_DIR   = Join-Path $novelDir 'outline'
    }
}

function Test-FileExists {
    param([string]$Path, [string]$Description)
    if (Test-Path -Path $Path -PathType Leaf) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}

function Test-DirHasFiles {
    param([string]$Path, [string]$Description)
    if ((Test-Path -Path $Path -PathType Container) -and (Get-ChildItem -Path $Path -ErrorAction SilentlyContinue | Where-Object { -not $_.PSIsContainer } | Select-Object -First 1)) {
        Write-Output "  ✓ $Description"
        return $true
    } else {
        Write-Output "  ✗ $Description"
        return $false
    }
}
