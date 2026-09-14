# gutpull

A tiny macOS/Linux shell plugin: type `gut` instead of `git` (an easy typo —
`i` and `u` are neighbors on the keyboard) and it plays an "Ouch!" sound,
then runs the real `git` command anyway.

```
$ gut status
🔊 "Ouch!"
On branch main
nothing to commit, working tree clean
```

## Install

```
git clone <this repo> ~/gutpull
cd ~/gutpull
./install.sh
```

This copies `gutpull.sh` and `sounds/ouch.wav` into `~/.gutpull` and adds a
`source` line to `~/.zshrc` and `~/.bashrc` (whichever exist). Restart your
shell, or run `source ~/.gutpull/gutpull.sh`, to start using it.

### oh-my-zsh / zinit users

You can skip `install.sh` and just source `gutpull.sh` directly from your
plugin manager of choice (it defines a single `gut` function and has no
external dependencies beyond a standard audio player).

## Uninstall

```
./uninstall.sh
```

Removes `~/.gutpull` and the added lines from your rc files.

## Sound playback

`gutpull.sh` picks the first available player at runtime: `afplay` (macOS),
then `paplay`, `aplay`, `ffplay`, or `play` (sox) on Linux. If none of those
are installed it silently skips the sound and still runs `git`. On most
Linux desktops one of `pulseaudio-utils` (`paplay`) or `alsa-utils`
(`aplay`) is already present; install one of them if you want the sound.

## Regenerating the sound

`sounds/ouch.wav` was generated from macOS's `say` command. To tweak it,
run `./scripts/generate-ouch.sh` (requires `say` and `ffmpeg`) on a Mac and
commit the result.
