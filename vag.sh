#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#19191f1f1d1d'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#d9d9e6e6f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#303030303030:#a8a871713939:#3939a8a87171:#7171a8a83939:#71713939a8a8:#a8a839397171:#39397171a8a8:#8a8a8a8a8a8a:#494949494949:#b0b076763b3b:#3b3bb0b07676:#7676b0b03b3b:#76763b3bb0b0:#b0b03b3b7676:#3b3b7676b0b0:#cfcfcfcfcfcf'
