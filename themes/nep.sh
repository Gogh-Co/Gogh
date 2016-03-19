#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#dd6f00"           # SYNTAX_STRING
COLOR_03="#00dd6f"           # COMMAND
COLOR_04="#6fdd00"           # COMMAND_COLOR2
COLOR_05="#6f00dd"           # PATH
COLOR_06="#dd006f"           # SYNTAX_VAR
COLOR_07="#006fdd"           # PROMP
COLOR_08="#f2f2f2"           #

COLOR_09="#7d7d7d"           #
COLOR_10="#ffb974"           # COMMAND_ERROR
COLOR_11="#74ffb9"           # EXEC
COLOR_12="#b9ff74"           #
COLOR_13="#b974ff"           # FOLDER
COLOR_14="#ff74b9"           #
COLOR_15="#74b9ff"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#758480"   # Background Color
FOREGROUND_COLOR="#23476a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
