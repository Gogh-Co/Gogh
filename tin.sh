#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#8d534e"          # SYNTAX_STRING
COLOR_03="#4e8d53"          # COMMAND
COLOR_04="#888d4e"          # COMMAND_COLOR2
COLOR_05="#534e8d"          # PATH
COLOR_06="#8d4e88"          # SYNTAX_VAR
COLOR_07="#4e888d"          # PROMP
COLOR_08="#ffffff"          #

COLOR_09="#000000"          #
COLOR_10="#b57d78"          # COMMAND_ERROR
COLOR_11="#78b57d"          # EXEC
COLOR_12="#b0b578"          #
COLOR_13="#7d78b5"          # FOLDER
COLOR_14="#b578b0"          #
COLOR_15="#78b0b5"          #
COLOR_16="#ffffff"          #

BACKGROUND_COLOR="#2e2e35"  # Background Color
FOREGROUND_COLOR="#ffffff"  # Text
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
