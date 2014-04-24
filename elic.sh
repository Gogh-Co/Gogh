#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#4A4A45453E3E'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#f2f2f2f2f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#303030303030:#e1e132321a1a:#6a6ab0b01717:#ffffc0c00505:#72729F9FCFCF:#ecec00004848:#2a2aa7a7e7e7:#f2f2f2f2f2f2:#5d5d5d5d5d5d:#ffff36361e1e:#7b7bc9c91f1f:#ffffd0d00a0a:#00007171ffff:#ffff1d1d6262:#4b4bb8b8fdfd:#a0a02020f0f0'


