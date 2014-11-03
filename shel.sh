#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#2a2a20201f1f'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#48488282cdcd'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#2c2c24242323:#abab24246363:#6c6ca3a32323:#abab64642323:#2c2c6464a2a2:#6c6c2424a2a2:#2c2ca3a36363:#919189898888:#919189898888:#f5f58888b9b9:#c2c2eeee8686:#f5f5baba8686:#8f8fbabaecec:#c2c28888ecec:#8f8feeeeb9b9:#f5f5eeeeecec'
