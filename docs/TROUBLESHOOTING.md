# Troubleshooting

Common installation problems, grouped by platform or terminal, with the
fix that worked for other users. If your issue isn't listed here, check
[existing issues](https://github.com/Gogh-Co/Gogh/issues) before opening
a new one.

- [Alacritty](#alacritty)
- [Arch Linux](#arch-linux)
- [Debian](#debian)
- [Elementary OS](#elementary-os)
- [Fedora 40](#fedora-40)
- [Fish / NuShell](#fish--nushell)
- [Terminator](#terminator)
- [Termux](#termux)
- [Ubuntu 19.10](#ubuntu-1910)
- [Ubuntu 24.04](#ubuntu-2404)
- [WSL (Windows Subsystem for Linux)](#wsl-windows-subsystem-for-linux)
- [xfce4-terminal](#xfce4-terminal)

## Alacritty

**[#304](https://github.com/Gogh-Co/Gogh/issues/304):** `KeyError: 'colors'` when applying a theme.

Alacritty's config only accepts colors if the `colors:` block (and its `primary`, `normal`, `bright` sub-keys) already exist. Uncomment or add that block in `alacritty.yml`, then run Gogh again:

```bash
export TERMINAL=alacritty
```

## Arch Linux

**[#297](https://github.com/Gogh-Co/Gogh/issues/297):** `dconf-cli` and `uuid-runtime` don't exist under those names on Arch — see [Pre-Install](../README.md#-pre-install) for the correct package names (`dconf`, `util-linux`; `util-linux` provides `uuidgen`, Arch's equivalent of `uuid-runtime`).

If `gsettings get org.gnome.Terminal.ProfilesList default` still errors after installing, log out/in (or reboot) to refresh the D-Bus session, then re-run Gogh.

## Debian

**[#63](https://github.com/Gogh-Co/Gogh/issues/63):** script runs but nothing happens — usually a missing or unnamed "Default" profile.

#### [Fix 1](https://github.com/Gogh-Co/Gogh/issues/63#issuecomment-361071956) (@romzie)

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

#### [Fix 2](https://github.com/Gogh-Co/Gogh/issues/63#issuecomment-401224491) (@MalwareJedi)

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

- Close your terminal, re-open it.
- Go to **Edit → Preferences → Profiles**.
- Create a **new** profile called **Default**.
- Close and re-open the terminal, confirm **Default** is still listed.
- Run the Gogh script again.

#### [Fix 3](https://github.com/Gogh-Co/Gogh/issues/63#issuecomment-401510226) (@sui74)

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
sudo apt install uuid-runtime
```

Then rename the profile called "default" and run the Gogh script.

**[#334](https://github.com/Gogh-Co/Gogh/issues/334#issuecomment-1374541799):** `read: '/apps/gnome-terminal/profiles/default_profile': not a valid identifier` — missing `GConf2`.

```bash
sudo apt install gconf2
```

**[#492](https://github.com/Gogh-Co/Gogh/issues/492):** script exits with no visible error and no theme applied — missing `uuid-runtime`, needed to generate the profile UUID.

```bash
sudo apt install uuid-runtime
```

## Elementary OS

**[#175](https://github.com/Gogh-Co/Gogh/issues/175):** "Unsupported terminal!" — Pantheon Terminal's identifier has changed names over the years; force the current one:

```bash
export TERMINAL='io.elementary.terminal'
```

Then re-run Gogh.

**Color prompt not showing:** uncomment the following line in `~/.bashrc`:

```bash
#force_color_prompt=yes
```

Then apply it:

```bash
source ~/.bashrc
```

## Fedora 40

**[#466](https://github.com/Gogh-Co/Gogh/issues/466):** GNOME Terminal on Fedora 40 needs `GConf2`, which isn't installed by default.

```bash
sudo dnf install -y GConf2 gnome-terminal
```

Re-run Gogh and confirm the theme applies in a new terminal session.

## Fish / NuShell

**[#303](https://github.com/Gogh-Co/Gogh/issues/303):** the one-line install command fails — Fish and NuShell don't support the `$(...)` command substitution syntax `bash -c "$(...)"` relies on.

Wrap the whole thing in an outer `bash -c` instead:

```bash
bash -c 'bash -c "$(wget -qO- https://gogh.website/gogh)"'
```

## Terminator

**[#439](https://github.com/Gogh-Co/Gogh/issues/439):** `ModuleNotFoundError: No module named 'configobj'`. This is a missing dependency of Terminator itself, not a Gogh bug.

```bash
sudo apt install python3-configobj
# or
pip install configobj
```

## Termux

**[#252](https://github.com/Gogh-Co/Gogh/issues/252):** Termux doesn't use dconf, so Gogh's terminal detection doesn't apply — set colors manually instead.

```bash
mkdir -p ~/.termux
nano ~/.termux/colors.properties
```

Paste your chosen theme's palette (`background`, `foreground`, `cursor`, `color0`–`color15`) from its `.yml` file in [`themes/`](../themes/), then apply:

```bash
termux-reload-settings
```

If you use *Termux:Styling*, you can manage colors from its UI instead.

## Ubuntu 19.10

**[#203](https://github.com/Gogh-Co/Gogh/issues/203), [#260](https://github.com/Gogh-Co/Gogh/issues/260):** `default_profile: not a valid identifier` / command not found — usually a missing "Default" profile or missing dependencies.

```bash
sudo apt update
sudo apt install -y dconf-cli uuid-runtime gnome-terminal
```

Create or rename your GNOME Terminal profile to **Default**, then re-run Gogh. Verify with:

```bash
gsettings get org.gnome.Terminal.ProfilesList list
gsettings get org.gnome.Terminal.ProfilesList default
```

## Ubuntu 24.04

**[#523](https://github.com/Gogh-Co/Gogh/issues/523):** `default_profile: not a valid identifier` even with all dependencies installed — GNOME Terminal's "Use colors from system theme" option can conflict with Gogh's palette and trigger this error.

Go to **Terminal → Preferences → [your profile] → Colors**, uncheck **Use colors from system theme**, then re-run Gogh.

## WSL (Windows Subsystem for Linux)

**[#333](https://github.com/Gogh-Co/Gogh/issues/333):** `/usr/bin/env: 'bash\r': No such file or directory` — the script has Windows-style CRLF line endings, usually from being edited or downloaded through a Windows tool.

Convert it to Unix (LF) line endings before running, e.g.:

```bash
dos2unix install.sh
```

## xfce4-terminal

**[#508](https://github.com/Gogh-Co/Gogh/issues/508), [#463](https://github.com/Gogh-Co/Gogh/issues/463):** the theme writes correctly to `terminalrc`, but the terminal window Gogh was run from doesn't live-reload it. Open a **new** xfce4-terminal window or tab to see the applied theme.
