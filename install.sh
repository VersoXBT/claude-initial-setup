#!/bin/bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

mkdir -p "$SKILLS_DIR"

count=0
for skill_dir in "$REPO_DIR"/skills/*/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    ln -sfn "$skill_dir" "$SKILLS_DIR/$skill_name"
    count=$((count + 1))
  fi
done

echo "Installed $count skills to $SKILLS_DIR"
echo "Skills are now available in Claude Code."
