#!/usr/bin/env bash

set -e

# Parse command line arguments
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --help|-h)
            echo "Usage: $0 [--json]"
            echo "  --json    Output results in JSON format"
            echo "  --help    Show this help message"
            exit 0
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
done

# Get script directory and load common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
eval $(get_novel_paths)

# Check if we're on a proper novel branch (only for git repos)
check_novel_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the novel directory exists
mkdir -p "$NOVEL_DIR"

# Copy outline template if it exists
TEMPLATE="$REPO_ROOT/templates/outline-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$IMPL_PLAN"
    echo "Copied outline template to $IMPL_PLAN"
else
    echo "Warning: Outline template not found at $TEMPLATE"
    # Create a basic outline file if template doesn't exist
    touch "$IMPL_PLAN"
fi

# Output results (using story-specific variable names)
if $JSON_MODE; then
    printf '{"STORY_SPEC":"%s","STORY_OUTLINE":"%s","SPECS_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$NOVEL_PREMISE" "$IMPL_PLAN" "$NOVEL_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "STORY_SPEC: $NOVEL_PREMISE"
    echo "STORY_OUTLINE: $IMPL_PLAN"
    echo "SPECS_DIR: $NOVEL_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi