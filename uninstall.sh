#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

count=0
for skill_dir in "$REPO_DIR"/skills/*/*/; do
  skill_name=$(basename "$skill_dir")
  target="$SKILLS_DIR/$skill_name"
  if [ -L "$target" ]; then
    rm "$target"
    count=$((count + 1))
  fi
done

echo "Removed $count skills from $SKILLS_DIR"
