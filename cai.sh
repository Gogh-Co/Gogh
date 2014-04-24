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
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#caca27274d4d:#4d4dcaca2727:#cacaa4a42727:#27274d4dcaca:#a4a42727caca:#2727cacaa4a4:#808080808080:#808080808080:#e9e98d8da3a3:#a3a3e9e98d8d:#e9e9d4d48d8d:#8d8da3a3e9e9:#d4d48d8de9e9:#8d8de9e9d4d4:#ffffffffffff'
