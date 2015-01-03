#!/bin/bash

# ====================CONFIG THIS =============================== #

BACKGROUD_COLOR="#141414"    # Background Color
FOREGROUND_COLOR="#94a3a5"   # Text
COLOR_01="#282a2e"           # HOST
COLOR_03="#8C9440"           # COMMAND
COLOR_04="#de935f"           # COMMAND_COLOR2
COLOR_10="#cc6666"           # COMMAND_ERROR
COLOR_05="#5F819D"           # PATH
COLOR_07="#5E8D87"           # PROMP
COLOR_11="#b5bd68"           # EXEC
COLOR_13="#81a2be"           # FOLDER

COLOR_02="#A54242"           # SYNTAX_STRING
COLOR_06="#85678F"           # SYNTAX_VAR

COLOR_08="#969896"           # COLOR_08
COLOR_09="#373b41"           # COLOR_09
COLOR_12="#f0c674"           # COLOR_12
COLOR_14="#b294bb"           # COLOR_14
COLOR_15="#8abeb7"           # COLOR_15
COLOR_16="#c5c8c6"           # COLOR_16

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
COLOR_03=$(gnome_color $COLOR_03)
COLOR_04=$(gnome_color $COLOR_04)
COLOR_10=$(gnome_color $COLOR_10)
COLOR_05=$(gnome_color $COLOR_05)
COLOR_07=$(gnome_color $COLOR_07)
COLOR_11=$(gnome_color $COLOR_11)
COLOR_13=$(gnome_color $COLOR_13)

COLOR_02=$(gnome_color $COLOR_02)
COLOR_06=$(gnome_color $COLOR_06)



# |
# | Apply Variables
# | ===========================================

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_background --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color "${BACKGROUD_COLOR}"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color "${FOREGROUND_COLOR}"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
