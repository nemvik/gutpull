# gutpull

You meant to type `git`. Your fingers, in their infinite wisdom, typed `gut`
instead — `i` and `u` live right next to each other on the keyboard and
apparently your pinky doesn't care. `gutpull` is here to make sure that
mistake *hurts*, just a little, every single time.

Install this, and typing `gut` instead of `git` gets you an anguished
"Ouch!" through your speakers before it quietly runs the real `git` command
anyway, because we're mean, not cruel.

![demo](demo.gif)

## Install

```
git clone https://github.com/nemvik/gutpull.git
cd gutpull
./install.sh
```

This copies `gutpull.sh` and `sounds/ouch.wav` into `~/.gutpull` and adds a
`source` line to `~/.zshrc` and `~/.bashrc` (whichever exist). Restart your
shell, or run `source ~/.gutpull/gutpull.sh`, to start feeling the
consequences of your actions.

### oh-my-zsh / zinit users

You can skip `install.sh` and just source `gutpull.sh` directly from your
plugin manager of choice (it defines a single `gut` function and has no
external dependencies beyond a standard audio player).

## Uninstall

```
./uninstall.sh
```

Removes `~/.gutpull` and the added lines from your rc files. Your fingers
are on their own again.

## Sound playback

`gutpull.sh` picks the first available player at runtime: `afplay` (macOS),
then `paplay`, `aplay`, `ffplay`, or `play` (sox) on Linux. If none of those
are installed it silently skips the sound and still runs `git` — no ouch,
but also no crash. On most Linux desktops one of `pulseaudio-utils`
(`paplay`) or `alsa-utils` (`aplay`) is already present; install one of them
if you want the full experience.

## The sound

`sounds/ouch.wav` is a free sound effect, hand-picked for maximum comedic
pain. Feel free to swap it for your own favorite flavor of "ouch" — any
short `.wav` dropped in at that path works, no code changes needed.

## Regenerating the demo GIF

The GIF at the top was recorded with [asciinema](https://asciinema.org) and
converted with [agg](https://github.com/asciinema/agg):

```
asciinema rec -c "bash scripts/demo-record.sh" demo.cast
agg --theme dracula --font-size 18 demo.cast demo.gif
```
