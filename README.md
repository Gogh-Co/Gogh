Elementary-OS-Terminal-Colors
=============================

## Color Schemes For Linux Mint - Ubuntu
----------------

Download and save the script file, make this file executable and run it:

```bash
    $ wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/elementary.sh
    $ chmod +x elementary.sh
    $ ./elementary.sh
```

oneline command

```bash
    $ wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/elementary.sh && chmod +x elementary.sh && ./elementary.sh && rm elementary.sh
```

Alternatively you can open the file and copy and paste lines directly into your shell.

```bash
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#101010101010'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#f2f2f2f2f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "#303030303030:#e1e132321a1a:#6a6ab0b01717:#ffffc0c00505:#00004f4f9e9e:#ecec00004848:#2a2aa7a7e7e7:#f2f2f2f2f2f2:#5d5d5d5d5d5d:#ffff36361e1e:#7b7bc9c91f1f:#ffffd0d00a0a:#00007171ffff:#ffff1d1d6262:#4b4bb8b8fdfd:#a0a02020f0f0"
```

## Credits:

```bash
    http://ciembor.github.io/4bit/     
```

### Script themes:

- azu.sh

![azu](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/azu.png)

```bash
    $ THEMEE="azu.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- cai.sh

![cai](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/cai.png)

```bash
    $ THEMEE="cai.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- elementary.sh

![elementary](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elementary.png)

```bash
    $ THEMEE="elementary.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- elic.sh

![elic](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elic.png)

```bash
    $ THEMEE="elic.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- elio.sh

![elio](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/elio.png)

```bash
    $ THEMEE="elio.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- miu.sh

![miu](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/miu.png)

```bash
    $ THEMEE="miu.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- tin.sh

![tin](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/tin.png)

```bash
    $ THEMEE="tin.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- aci.sh

![aci](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/aci.png)

```bash
    $ THEMEE="aci.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

- aco.sh

![aco](https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/images/aco.png)

```bash
    $ THEMEE="aco.sh" && wget https://raw.githubusercontent.com/Mayccoll/Elementary-OS-Terminal-Colors/master/$THEMEE && chmod +x $THEMEE && ./$THEMEE && rm $THEMEE
```

### More colors

copy and paste lines directly into your shell.

```bash
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#393945455252:#c0c05b5b5b5b:#5b5bc0c05b5b:#c0c0c0c05b5b:#5b5b5b5bc0c0:#c0c05b5bc0c0:#5b5bc0c0c0c0:#aaaab7b7c4c4:#62626e6e7b7b:#f5f5e5e5e5e5:#e5e5f5f5e5e5:#f5f5f5f5e5e5:#e5e5e5e5f5f5:#f5f5e5e5f5f5:#e5e5f5f5f5f5:#d9d9e5e5f2f2'
``` 


```bash
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#393945455252:#cdcd48484848:#4848cdcd4848:#cdcdcdcd4848:#48484848cdcd:#cdcd4848cdcd:#4848cdcdcdcd:#aaaab7b7c4c4:#62626e6e7b7b:#dddd83838383:#8383dddd8383:#dddddddd8383:#83838383dddd:#dddd8383dddd:#8383dddddddd:#d9d9e5e5f2f2'
```

```bash
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false 
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false 
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#fbfbf9f9d8d8'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#454551515e5e'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#252531313e3e:#bcbc27272f2f:#2f2fbcbc2727:#bcbcb4b42727:#27272f2fbcbc:#b4b42727bcbc:#2727bcbcb4b4:#8f8f9c9ca9a9:#454551515e5e:#eeeeaeaeb2b2:#b2b2eeeeaeae:#eeeeebebaeae:#aeaeb2b2eeee:#ebebaeaeeeee:#aeaeeeeeebeb:#a2a2afafbcbc'
```


