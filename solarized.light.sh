#!/bin/bash

# ====================CONFIG THIS =============================== #

COLOR_01="#002b36"           # HOST
COLOR_02="#dc322f"           # SYNTAX_STRING
COLOR_03="#859900"           # COMMAND
COLOR_04="#b58900"           # COMMAND_COLOR2
COLOR_05="#268bd2"           # PATH
COLOR_06="#6c71c4"           # SYNTAX_VAR
COLOR_07="#2aa198"           # PROMP
COLOR_08="#93a1a1"           #

COLOR_09="#1c1c1c"           #
COLOR_10="#d70000"           # COMMAND_ERROR
COLOR_11="#5f8700"           # EXEC
COLOR_12="#af8700"           #
COLOR_13="#0087ff"           # FOLDER
COLOR_14="#5f5faf"           #
COLOR_15="#00afaf"           #
COLOR_16="#8a8a8a"           #

BACKGROUD_COLOR="#fdf6e3"    # Background Color
FOREGROUND_COLOR="#586e75"   # Text

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
# | Set gnome Variables
# | ===========================================

BACKGROUD_COLOR=$(gnome_color $BACKGROUD_COLOR)
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
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color "${BACKGROUD_COLOR}"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color "${FOREGROUND_COLOR}"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
