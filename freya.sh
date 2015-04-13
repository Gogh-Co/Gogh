#!/bin/bash

# ====================  CONFIG THIS ========================================= #

BLACK="#073642"                   # COLOR_01 <--
RED="#DC322F"                     # COLOR_02
GREEN="#859900"                   # COLOR_03 <--
YELLOW="#B58900"                  # COLOR_04 <--
BLUE="#268BD2"                    # COLOR_05 <--
PURPLE="#EC0048"                  # COLOR_06
CYAN="#2AA198"                    # COLOR_07 <--
WHITE="#94A3A5"                   # COLOR_08

BBLACK="#586E75"                  # COLOR_09
BRED="#CB4B16"                    # COLOR_10 <--
BGREEN="#859900"                  # COLOR_11 <--
BYELLOW="#B58900"                 # COLOR_12
BBLUE="#268BD2"                   # COLOR_13 <--
BPURPLE="#D33682"                 # COLOR_14
BCYAN="#2AA198"                   # COLOR_15
BWHITE="#EEEEEE"                  # COLOR_16

BACKGROUD_COLOR="#2D363A"         # Background Color
FOREGROUND_COLOR="#94A3A5"        # Text


COLOR_01=$BLACK                   # HOST
COLOR_03=$GREEN                   # COMMAND
COLOR_04=$YELLOW                  # COMMAND_COLOR2
COLOR_10=$BRED                    # COMMAND_ERROR
COLOR_05=$BLUE                    # PATH
COLOR_07=$CYAN                    # PROMP
COLOR_11=$BGREEN                  # EXEC
COLOR_13=$BBLUE                   # FOLDER

COLOR_02=$RED                     # SYNTAX_STRING
COLOR_06=$PURPLE                  # SYNTAX_VAR

COLOR_08=$WHITE
COLOR_09=$BBLACK
COLOR_12=$BYELLOW
COLOR_14=$BPURPLE
COLOR_15=$BCYAN
COLOR_16=$BWHITE

# =====================  END CONFIG   ======================================= #


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
