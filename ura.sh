#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#fefeffffeeee'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#232347476a6a'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#c2c21b1b6f6f:#6f6fc2c21b1b:#c2c26f6f1b1b:#1b1b6f6fc2c2:#6f6f1b1bc2c2:#1b1bc2c26f6f:#808080808080:#808080808080:#eeee8484b9b9:#b9b9eeee8484:#eeeeb9b98484:#8484b9b9eeee:#b9b98484eeee:#8484eeeeb9b9:#e5e5e5e5e5e5'
