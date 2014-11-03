#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#010128284949'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#a9a9bebed8d8'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#2c2c24242323:#f5f55757a0a0:#a9a9eeee5555:#f5f5a2a25555:#5e5ea2a2ecec:#a9a95757ecec:#5e5eeeeea0a0:#919189898888:#919189898888:#f5f57979b2b2:#bbbbeeee7878:#f5f5b3b37878:#8181b3b3ecec:#bbbb7979ecec:#8181eeeeb2b2:#f5f5eeeeecec'
