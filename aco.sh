#!/bin/bash

# Save this script into set_colors.sh, make this file executable and run it:
#
# $ chmod +x set_colors.sh
# $ ./set_colors.sh
#
# Alternatively copy lines below directly into your shell.

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#1f1f13130505'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#b4b4e1e1fdfd'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#3f3f3f3f3f3f:#ffff08088383:#8383ffff0808:#ffff83830808:#08088383ffff:#83830808ffff:#0808ffff8383:#bebebebebebe:#474747474747:#ffff1e1e8e8e:#8e8effff1e1e:#ffff8e8e1e1e:#1e1e8e8effff:#8e8e1e1effff:#1e1effff8e8e:#c4c4c4c4c4c4'
