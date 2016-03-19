#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # HOST
COLOR_02="#dd006f"           # SYNTAX_STRING
COLOR_03="#6fdd00"           # COMMAND
COLOR_04="#dd6f00"           # COMMAND_COLOR2
COLOR_05="#006fdd"           # PATH
COLOR_06="#6f00dd"           # SYNTAX_VAR
COLOR_07="#00dd6f"           # PROMP
COLOR_08="#f2f2f2"           #

COLOR_09="#7d7d7d"           #
COLOR_10="#ff74b9"           # COMMAND_ERROR
COLOR_11="#b9ff74"           # EXEC
COLOR_12="#ffb974"           #
COLOR_13="#74b9ff"           # FOLDER
COLOR_14="#b974ff"           #
COLOR_15="#74ffb9"           #
COLOR_16="#ffffff"           #

BACKGROUND_COLOR="#758480"   # Background Color
FOREGROUND_COLOR="#23476a"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =====================  END CONFIG   ======================================= #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
