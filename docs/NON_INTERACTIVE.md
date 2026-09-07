# Non-Interactive Install

For scripting, dotfiles, provisioning tools, CI, or container images — installing a theme without going through `gogh.sh`'s interactive menu.

- [Method 1: clone the repository](#method-1-clone-the-repository)
- [Method 2: download only what you need](#method-2-download-only-what-you-need)
- [Environment variables](#environment-variables)

## Method 1: Clone the repository

```bash
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

export TERMINAL=gnome-terminal  # or whichever terminal you're targeting

# Alacritty needs its Python dependency installed first
pip install -r requirements.txt

cd installs
./dracula.sh
```

## Method 2: Download only what you need

Skip cloning the whole repo — just grab `apply-colors.sh` and the one theme's install script from [`installs/`](../installs/):

```bash
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-dark.sh
```

Alacritty and Terminator each need an extra Python helper script:

```bash
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-alacritty.py    # only for Alacritty
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-terminator.py   # only for Terminator
```

Then apply the theme (the apply script must be in the same folder, or point `GOGH_APPLY_SCRIPT` at it):

```bash
TERMINAL=gnome-terminal bash ./selenized-dark.sh
```

## Environment variables

| Variable | Purpose |
| --- | --- |
| `TERMINAL` | Which terminal to install the theme for — see the [Terminal Support table](../README.md#-terminal-support) for supported values. Auto-detected if unset. |
| `GOGH_NONINTERACTIVE` | Silences output and answers every prompt with its default instead of asking. Errors still print. |
| `GOGH_USE_NEW_THEME` | Applies the theme to the terminal's current session automatically instead of asking "apply new theme?". Only affects Tilix, XFCE4 Terminal, and Termux — other terminals ignore it. |
| `GOGH_APPLY_SCRIPT` | Path to `apply-colors.sh`, if it isn't next to the theme's install script. |
| `GOGH_ALACRITTY_SCRIPT` | Path to `apply-alacritty.py`. Only needed for Alacritty. |
| `GOGH_TERMINATOR_SCRIPT` | Path to `apply-terminator.py`. Only needed for Terminator. |

Combining a few of these:

```bash
GOGH_APPLY_SCRIPT=/path/to/apply-colors.sh TERMINAL=gnome-terminal GOGH_NONINTERACTIVE=1 bash ./selenized-dark.sh
```
