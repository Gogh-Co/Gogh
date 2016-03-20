#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#b87a7a"           # SYNTAX_STRING
COLOR_03="#7ab87a"           # COMMAND
COLOR_04="#b8b87a"           # COMMAND_COLOR2
COLOR_05="#7a7ab8"           # PATH
COLOR_06="#b87ab8"           # SYNTAX_VAR
COLOR_07="#7ab8b8"           # PROMP
COLOR_08="#d9d9d9"           #

COLOR_09="#262626"           #
COLOR_10="#dbbdbd"           # COMMAND_ERROR
COLOR_11="#bddbbd"           # EXEC
COLOR_12="#dbdbbd"           #
COLOR_13="#bdbddb"           # FOLDER
COLOR_14="#dbbddb"           #
COLOR_15="#bddbdb"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#0d1926"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
