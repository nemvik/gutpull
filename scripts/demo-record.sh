#!/usr/bin/env bash
# Fakes a user typing `gut status` for the demo recording.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

GUTPULL_DIR="$repo_root"
# shellcheck source=/dev/null
source "$repo_root/gutpull.sh"

printf '\033[1;32m$ \033[0m'
text="gut status"
for ((i = 0; i < ${#text}; i++)); do
  printf '%s' "${text:$i:1}"
  sleep 0.09
done
sleep 0.5
printf '\n'
gut status
sleep 2
