#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#757584848080'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#232347476a6a'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#dddd00000707:#0707dddd0000:#ddddd6d60000:#00000707dddd:#d6d60000dddd:#0000ddddd6d6:#f2f2f2f2f2f2:#7d7d7d7d7d7d:#ffff74747878:#7878ffff7474:#fffffafa7474:#74747878ffff:#fafa7474ffff:#7474fffffafa:#ffffffffffff'
