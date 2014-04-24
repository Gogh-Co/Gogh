#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false 
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false 
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#090911111a1a'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#d9d9e6e6f2f2'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#acac6d6d7474:#7474acac6d6d:#acaca4a46d6d:#6d6d7474acac:#a4a46d6dacac:#6d6dacaca4a4:#e6e6e6e6e6e6:#262626262626:#d6d6b8b8bcbc:#bcbcd6d6b8b8:#d6d6d3d3b8b8:#b8b8bcbcd6d6:#d3d3b8b8d6d6:#b8b8d6d6d3d3:#ffffffffffff'
