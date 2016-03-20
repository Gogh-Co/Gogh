#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073642"           # HOST
COLOR_02="#DC322F"           # SYNTAX_STRING
COLOR_03="#859900"           # COMMAND
COLOR_04="#B58900"           # COMMAND_COLOR2
COLOR_05="#268BD2"           # PATH
COLOR_06="#D33682"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#EEE8D5"           #

COLOR_09="#002B36"           #
COLOR_10="#CB4B16"           # COMMAND_ERROR
COLOR_11="#586E75"           # EXEC
COLOR_12="#657B83"           #
COLOR_13="#839496"           # FOLDER
COLOR_14="#6C71C4"           #
COLOR_15="#93A1A1"           #
COLOR_16="#FDF6E3"           #

BACKGROUND_COLOR="#FDF6E3"   # Background Color
FOREGROUND_COLOR="#657B83"   # Text
BOLD_COLOR="#586E75"         # Bold
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
