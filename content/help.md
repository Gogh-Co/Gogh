
![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/gogh/Gogh-logo.png)

-----

# HELP

- [Ubuntu 19.10: default_profile not a valid identifier, command not found](https://github.com/Mayccoll/Gogh/issues/203)
- [Using Elementary terminal but says unsupported](https://github.com/Mayccoll/Gogh/issues/175)
- [Doesn't working Debian](https://github.com/Mayccoll/Gogh/issues/63)
- [Not Working on Ubuntu](https://github.com/Mayccoll/Gogh/issues/41)

## Elementary OS

1 - Uncomment the following line in `.bashrc` you can find this file in your `/home/USER/` directory.

```bash
    #force_color_prompt=yes
```

2 - Execute in terminal

```bash
source .bashrc
```

## Debian Fixes

### [Fix 1](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-361071956) (@romzie):

- reset your profiles:

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

### [Fix 2](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-401224491) (@MalwareJedi):

- Reset your profiles:

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

- Close your terminal. Re-open the terminal.
- Go to **Edit** ---> **Preferences** ---> **Profiles**.
- Create NEW profile called **Default**.
- Close the terminal. Re-open the terminal.
- Confirm **Default** is still listed in your profiles.
- If it is, run the Gogh script again.

### [Fix 3](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-401510226) (@sui74):

- Reset your profiles:

```bash
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

- "Unname" Rename profile called "default".

```bash
sudo apt install uuid-runtime
```
- run Gogh script.

-----

## Create a command line

**WARNING:** *Only if you know what you are doing or trust me :)*

```bash
sudo wget -O /usr/local/bin/gogh https://git.io/vQgMr && sudo chmod +x /usr/local/bin/gogh
```

Now in your terminal just type `gogh`:

```bash
gogh
```
