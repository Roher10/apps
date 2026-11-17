#!/usr/bin/env bash
# Installs the working-method skill for every Claude Code session on this Mac.
set -euo pipefail

src="$(cd "$(dirname "$0")" && pwd)"
dest="$HOME/.claude/skills/working-method"
memory="$HOME/.claude/CLAUDE.md"
line='For any non-trivial task, load and follow the `working-method` skill before starting, and run its pre-finish checklist before reporting.'

mkdir -p "$dest"
cp "$src/SKILL.md" "$dest/SKILL.md"
echo "Installed skill: $dest/SKILL.md"

touch "$memory"
if ! grep -qF 'working-method' "$memory"; then
  printf '\n%s\n' "$line" >> "$memory"
  echo "Added a pointer to $memory"
else
  echo "$memory already mentions working-method; left unchanged"
fi

echo "Done. Start a new Claude Code session and run /working-method to check it loads."
