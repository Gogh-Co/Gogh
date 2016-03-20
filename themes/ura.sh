#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#c21b6f"          # SYNTAX_STRING
COLOR_03="#6fc21b"          # COMMAND
COLOR_04="#c26f1b"          # COMMAND_COLOR2
COLOR_05="#1b6fc2"          # PATH
COLOR_06="#6f1bc2"          # SYNTAX_VAR
COLOR_07="#1bc26f"          # PROMP
COLOR_08="#808080"          #

COLOR_09="#808080"          #
COLOR_10="#ee84b9"          # COMMAND_ERROR
COLOR_11="#b9ee84"          # EXEC
COLOR_12="#eeb984"          #
COLOR_13="#84b9ee"          # FOLDER
COLOR_14="#b984ee"          #
COLOR_15="#84eeb9"          #
COLOR_16="#e5e5e5"          #

BACKGROUND_COLOR="#feffee"  # Background Color
FOREGROUND_COLOR="#23476a"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
