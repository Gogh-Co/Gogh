#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#ac6d74"           # SYNTAX_STRING
COLOR_03="#74ac6d"           # COMMAND
COLOR_04="#aca46d"           # COMMAND_COLOR2
COLOR_05="#6d74ac"           # PATH
COLOR_06="#a46dac"           # SYNTAX_VAR
COLOR_07="#6daca4"           # PROMP
COLOR_08="#e6e6e6"           #

COLOR_09="#262626"           #
COLOR_10="#d6b8bc"           # COMMAND_ERROR
COLOR_11="#bcd6b8"           # EXEC
COLOR_12="#d6d3b8"           #
COLOR_13="#b8bcd6"           # FOLDER
COLOR_14="#d3b8d6"           #
COLOR_15="#b8d6d3"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#09111a"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
