#!/usr/bin/env bash
# Common functions and variables for all scripts

# Get repository root, with fallback for non-git repositories
get_repo_root() {
    if git rev-parse --show-toplevel >/dev/null 2>&1; then
        git rev-parse --show-toplevel
    else
        # Fall back to script location for non-git repos
        local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        (cd "$script_dir/../../.." && pwd)
    fi
}

# Get current branch, with fallback for non-git repositories
get_current_branch() {
    # First check if WRITEKIT_NOVEL environment variable is set
    if [[ -n "${WRITEKIT_NOVEL:-}" ]]; then
        echo "$WRITEKIT_NOVEL"
        return
    fi
    
    # Then check git if available
    if git rev-parse --abbrev-ref HEAD >/dev/null 2>&1; then
        git rev-parse --abbrev-ref HEAD
        return
    fi
    
    # For non-git repos, try to find the latest novel directory
    local repo_root=$(get_repo_root)
    local novels_dir="$repo_root/novels"

    if [[ -d "$novels_dir" ]]; then
        local latest_novel=""
        local highest=0

        for dir in "$novels_dir"/*; do
            if [[ -d "$dir" ]]; then
                local dirname=$(basename "$dir")
                if [[ "$dirname" =~ ^([0-9]{3})- ]]; then
                    local number=${BASH_REMATCH[1]}
                    number=$((10#$number))
                    if [[ "$number" -gt "$highest" ]]; then
                        highest=$number
                        latest_novel=$dirname
                    fi
                fi
            fi
        done
        
        if [[ -n "$latest_novel" ]]; then
            echo "$latest_novel"
            return
        fi
    fi
    
    echo "main"  # Final fallback
}

# Check if we have git available
has_git() {
    git rev-parse --show-toplevel >/dev/null 2>&1
}

check_novel_branch() {
    local branch="$1"
    local has_git_repo="$2"

    # For non-git repos, we can't enforce branch naming but still provide output
    if [[ "$has_git_repo" != "true" ]]; then
        echo "[writekit] Warning: Git repository not detected; skipped branch validation" >&2
        return 0
    fi

    if [[ ! "$branch" =~ ^[0-9]{3}- ]]; then
        echo "ERROR: Not on a novel branch. Current branch: $branch" >&2
        echo "Novel branches should be named like: 001-novel-name" >&2
        return 1
    fi

    return 0
}

get_novel_dir() { echo "$1/novels/$2"; }

get_novel_paths() {
    local repo_root=$(get_repo_root)
    local current_branch=$(get_current_branch)
    local has_git_repo="false"

    if has_git; then
        has_git_repo="true"
    fi

    local novel_dir=$(get_novel_dir "$repo_root" "$current_branch")

    cat <<EOF
REPO_ROOT='$repo_root'
CURRENT_BRANCH='$current_branch'
HAS_GIT='$has_git_repo'
NOVEL_DIR='$novel_dir'
NOVEL_PREMISE='$novel_dir/premise.md'
IMPL_PLAN='$novel_dir/plan.md'
TASKS='$novel_dir/tasks.md'
RESEARCH='$novel_dir/research.md'
DATA_MODEL='$novel_dir/data-model.md'
QUICKSTART='$novel_dir/quickstart.md'
CONTRACTS_DIR='$novel_dir/contracts'
CHARACTERS_DIR='$novel_dir/characters'
CHAPTERS_DIR='$novel_dir/chapters'
OUTLINE_DIR='$novel_dir/outline'
EOF
}

check_file() { [[ -f "$1" ]] && echo "  ✓ $2" || echo "  ✗ $2"; }
check_dir() { [[ -d "$1" && -n $(ls -A "$1" 2>/dev/null) ]] && echo "  ✓ $2" || echo "  ✗ $2"; }
