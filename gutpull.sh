#!/usr/bin/env bash
# gutpull: play an "ouch" sound when you type `gut` instead of `git`, then
# run git anyway. Works when sourced from both zsh and bash.

GUTPULL_DIR="${GUTPULL_DIR:-$HOME/.gutpull}"
GUTPULL_SOUND="$GUTPULL_DIR/sounds/ouch.wav"

_gutpull_play_sound() {
  local file="$1"
  [ -f "$file" ] || return 0

  if command -v afplay >/dev/null 2>&1; then
    afplay "$file"
  elif command -v paplay >/dev/null 2>&1; then
    paplay "$file"
  elif command -v aplay >/dev/null 2>&1; then
    aplay -q "$file"
  elif command -v ffplay >/dev/null 2>&1; then
    ffplay -nodisp -autoexit -loglevel quiet "$file"
  elif command -v play >/dev/null 2>&1; then
    play -q "$file"
  fi
}

gut() {
  { _gutpull_play_sound "$GUTPULL_SOUND" & } >/dev/null 2>&1
  git "$@"
}
