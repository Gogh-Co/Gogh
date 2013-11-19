Elementary-OS-Terminal-Colors
=============================

For Linux Mint
----------------

```bash
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#101010101010'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#f2f2f2f2f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "#303030303030:#e1e132321a1a:#6a6ab0b01717:#ffffc0c00505:#00004f4f9e9e:#ecec00004848:#2a2aa7a7e7e7:#f2f2f2f2f2f2:#5d5d5d5d5d5d:#ffff36361e1e:#7b7bc9c91f1f:#ffffd0d00a0a:#00007171ffff:#ffff1d1d6262:#4b4bb8b8fdfd:#a0a02020f0f0"
``` 



Others
======

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


