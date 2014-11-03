#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false 
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false 
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#ffffffffffff'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#232347476a6a'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#b5b540407b7b:#7b7bb5b54040:#b5b57b7b4040:#40407b7bb5b5:#7b7b4040b5b5:#4040b5b57b7b:#f8f8f8f8f8f8:#737373737373:#cdcd7373a0a0:#a0a0cdcd7373:#cdcda0a07373:#7373a0a0cdcd:#a0a07373cdcd:#7373cdcda0a0:#ffffffffffff'
