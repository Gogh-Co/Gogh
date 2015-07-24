#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#0a0a0a"           # HOST
COLOR_02="#ab8f74"           # SYNTAX_STRING
COLOR_03="#74ab8f"           # COMMAND
COLOR_04="#8fab74"           # COMMAND_COLOR2
COLOR_05="#8f74ab"           # PATH
COLOR_06="#ab748f"           # SYNTAX_VAR
COLOR_07="#748fab"           # PROMP
COLOR_08="#F2F2F2"           #

COLOR_09="#5D5D5D"           #
COLOR_10="#FF1D62"           # COMMAND_ERROR
COLOR_11="#9cc3af"           # EXEC
COLOR_12="#FFD00A"           #
COLOR_13="#af9cc3"           # FOLDER
COLOR_14="#FF1D62"           #
COLOR_15="#4BB8FD"           #
COLOR_16="#A020F0"           #

BACKGROUND_COLOR="#232E37"    # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
# =============================================================== #

# |
# | Convert RGB to gnome colors
# | ===========================================
function gnome_color () {

    AA=${1:1:2}
    BB=${1:3:2}
    CC=${1:5:2}

    echo "#${AA}${AA}${BB}${BB}${CC}${CC}"
}

# |
# | Check for OS and decide how to apply
# | ===========================================
if [ $(lsb_release -c -s) == "freya" ]; then

    # |
    # | Apply Variables
    # | ===========================================
    gsettings set org.pantheon.terminal.settings background "${BACKGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings foreground "${FOREGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"

else

    # |
    # | Set gnome Variables
    # | ===========================================
    BACKGROUND_COLOR=$(gnome_color $BACKGROUND_COLOR)
    FOREGROUND_COLOR=$(gnome_color $FOREGROUND_COLOR)
    COLOR_01=$(gnome_color $COLOR_01)
    COLOR_02=$(gnome_color $COLOR_02)
    COLOR_03=$(gnome_color $COLOR_03)
    COLOR_04=$(gnome_color $COLOR_04)
    COLOR_05=$(gnome_color $COLOR_05)
    COLOR_06=$(gnome_color $COLOR_06)
    COLOR_07=$(gnome_color $COLOR_07)
    COLOR_08=$(gnome_color $COLOR_08)
    COLOR_09=$(gnome_color $COLOR_09)
    COLOR_10=$(gnome_color $COLOR_10)
    COLOR_11=$(gnome_color $COLOR_11)
    COLOR_12=$(gnome_color $COLOR_12)
    COLOR_13=$(gnome_color $COLOR_13)
    COLOR_14=$(gnome_color $COLOR_14)
    COLOR_15=$(gnome_color $COLOR_15)
    COLOR_16=$(gnome_color $COLOR_16)

    # |
    # | Apply Variables
    # | ===========================================
    gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
    gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
    gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color "${BACKGROUND_COLOR}"
    gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color "${FOREGROUND_COLOR}"
    gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"

fi
