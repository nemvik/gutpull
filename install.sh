#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
install_dir="$HOME/.gutpull"

mkdir -p "$install_dir/sounds"
cp "$repo_root/gutpull.sh" "$install_dir/gutpull.sh"
cp "$repo_root/sounds/ouch.wav" "$install_dir/sounds/ouch.wav"

source_line='[ -f "$HOME/.gutpull/gutpull.sh" ] && source "$HOME/.gutpull/gutpull.sh"'

for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
  [ -f "$rc" ] || continue
  if ! grep -qF "$source_line" "$rc"; then
    printf '\n# gutpull: ouch sound when you type gut instead of git\n%s\n' "$source_line" >> "$rc"
    echo "Added gutpull to $rc"
  else
    echo "$rc already configured, skipping"
  fi
done

echo "Done. Restart your shell or run: source $install_dir/gutpull.sh"
