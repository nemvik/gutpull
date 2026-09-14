#!/usr/bin/env bash
set -euo pipefail

install_dir="$HOME/.gutpull"
source_line='[ -f "$HOME/.gutpull/gutpull.sh" ] && source "$HOME/.gutpull/gutpull.sh"'
comment_line='# gutpull: ouch sound when you type gut instead of git'

for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
  [ -f "$rc" ] || continue
  if grep -qF "$source_line" "$rc"; then
    tmp="$(mktemp)"
    grep -vF -e "$source_line" -e "$comment_line" "$rc" > "$tmp"
    mv "$tmp" "$rc"
    echo "Removed gutpull from $rc"
  fi
done

rm -rf "$install_dir"
echo "Done. Restart your shell to finish removing gutpull."
