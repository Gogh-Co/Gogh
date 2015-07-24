#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b5407b"           # SYNTAX_STRING
COLOR_03="#7bb540"           # COMMAND
COLOR_04="#b57b40"           # COMMAND_COLOR2
COLOR_05="#407bb5"           # PATH
COLOR_06="#7b40b5"           # SYNTAX_VAR
COLOR_07="#40b57b"           # PROMP
COLOR_08="#f8f8f8"           #

COLOR_09="#737373"           #
COLOR_10="#cd73a0"           # COMMAND_ERROR
COLOR_11="#a0cd73"           # EXEC
COLOR_12="#cda073"           #
COLOR_13="#73a0cd"           # FOLDER
COLOR_14="#a073cd"           #
COLOR_15="#73cda0"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#ffffff"   # Background Color
FOREGROUND_COLOR="#23476a"   # Text
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
