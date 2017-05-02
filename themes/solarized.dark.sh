#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#073642"           # HOST
COLOR_02="#DC322F"           # SYNTAX_STRING
COLOR_03="#859900"           # COMMAND
COLOR_04="#CF9A6B"           # COMMAND_COLOR2
COLOR_05="#268BD2"           # PATH
COLOR_06="#D33682"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#EEE8D5"           #

COLOR_09="#002B36"           #
COLOR_10="#D87979"           # COMMAND_ERROR
COLOR_11="#88CF76"           # EXEC
COLOR_12="#657B83"           #
COLOR_13="#2699FF"           # FOLDER
COLOR_14="#D33682"           #
COLOR_15="#43B8C3"           #
COLOR_16="#FDF6E3"           #

BACKGROUND_COLOR="#002B36"   # Background Color
FOREGROUND_COLOR="#839496"   # Text
BOLD_COLOR="#93A1A1"         # Bold
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
