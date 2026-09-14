#!/usr/bin/env bash
# Regenerates sounds/ouch.wav. Requires macOS `say` and ffmpeg.
# Run from the repo root: ./scripts/generate-ouch.sh
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_aiff="$(mktemp -t ouch).aiff"

say -o "$tmp_aiff" "Ouch!"
ffmpeg -y -i "$tmp_aiff" -ar 44100 "$repo_root/sounds/ouch.wav"

rm -f "$tmp_aiff"
echo "Wrote $repo_root/sounds/ouch.wav"
