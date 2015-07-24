#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c3e50"           # HOST
COLOR_02="#c0392b"           # SYNTAX_STRING
COLOR_03="#27ae60"           # COMMAND
COLOR_04="#f39c12"           # COMMAND_COLOR2
COLOR_05="#2980b9"           # PATH
COLOR_06="#8e44ad"           # SYNTAX_VAR
COLOR_07="#16a085"           # PROMP
COLOR_08="#bdc3c7"           #

COLOR_09="#34495e"           #
COLOR_10="#e74c3c"           # COMMAND_ERROR
COLOR_11="#2ecc71"           # EXEC
COLOR_12="#f1c40f"           #
COLOR_13="#3498db"           # FOLDER
COLOR_14="#9b59b6"           #
COLOR_15="#2AA198"           #
COLOR_16="#ecf0f1"           #

BACKGROUND_COLOR="#1F2D3A"   # Background Color
FOREGROUND_COLOR="#1abc9c"   # Text
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
