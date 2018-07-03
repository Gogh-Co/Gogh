
![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/gogh/Gogh-logo.png)

-----

## Install:

- Just copy and paste One line command.

- Each theme has his own line.

```bash
    $ wget -O xt  http://git.io/v3D4o && chmod +x xt && ./xt && rm xt
```
This way of installing is equals the below, the only thing is that a shortening of URLs (git.io) was used and fits all commands on a single line.

- **or** Download and save the script file, make this file executable and run it:

```bash
    $ wget https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/freya.sh
    $ chmod +x freya.sh
    $ ./freya.sh
```

## Elementary OS

1 - Uncomment the following line in `.bashrc` you can find this file in your `/home/USER/` directory.

```bash
    #force_color_prompt=yes
```

2 - Execute in terminal

```bash
    $ source .bashrc
```

## Debian Fixes

### [Fix 1](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-361071956) (@romzie):

- reset your profiles:

```bash
$ dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

### [Fix 2](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-401224491) (@MalwareJedi):

- Reset your profiles:

```bash
$ dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

- Close your terminal. Re-open the terminal.
- Go to Edit ---> Preferences ---> Profiles.
- Create NEW profile called "Default".
- Close the terminal. Re-open the terminal.
- Confirm "Default" is still listed in your profiles.
- If it is, run the Gogh script again.

### [Fix 3](https://github.com/Mayccoll/Gogh/issues/63#issuecomment-401510226) (@sui74):

- Reset your profiles:

```bash
$ dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

- "Unname" Rename profile called "default".

```bash
$ sudo apt install uuid-runtime
```
- run Gogh script.


## Install by Script

You also can execute this script. This will list all available themes allowing you to select the one you like.

```bash
  $ wget -O xt  http://git.io/vGz67 && chmod +x xt && ./xt && rm xt
```

## Create a command line

**WARNING:** *Only if you know what you are doing or trust me :)*

You have two options:

1. Without creating a profile with the name of the theme:

    ```bash
    $ sudo wget -O /usr/local/bin/gogh http://git.io/vGz67 && sudo chmod +x /usr/local/bin/gogh
    ```

2. Creating a profile with name of the theme:

    ```bash
    $ sudo wget -O /usr/local/bin/gogh https://git.io/vKOB6 && sudo chmod +x /usr/local/bin/gogh
    ```

Now in your terminal just type `gogh`:

```bash
  $ gogh
```

**DEMO:**

![Script Demo](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/demos/script-demo.gif)
