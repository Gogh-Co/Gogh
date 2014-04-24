#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#2e2e2e2e3535'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#ffffffffffff'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#8d8d53534e4e:#4e4e8d8d5353:#88888d8d4e4e:#53534e4e8d8d:#8d8d4e4e8888:#4e4e88888d8d:#ffffffffffff:#000000000000:#b5b57d7d7878:#7878b5b57d7d:#b0b0b5b57878:#7d7d7878b5b5:#b5b57878b0b0:#7878b0b0b5b5:#ffffffffffff'

