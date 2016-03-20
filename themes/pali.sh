#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#0a0a0a"           # HOST
COLOR_02="#ab8f74"           # SYNTAX_STRING
COLOR_03="#74ab8f"           # COMMAND
COLOR_04="#8fab74"           # COMMAND_COLOR2
COLOR_05="#8f74ab"           # PATH
COLOR_06="#ab748f"           # SYNTAX_VAR
COLOR_07="#748fab"           # PROMP
COLOR_08="#F2F2F2"           #

COLOR_09="#5D5D5D"           #
COLOR_10="#FF1D62"           # COMMAND_ERROR
COLOR_11="#9cc3af"           # EXEC
COLOR_12="#FFD00A"           #
COLOR_13="#af9cc3"           # FOLDER
COLOR_14="#FF1D62"           #
COLOR_15="#4BB8FD"           #
COLOR_16="#A020F0"           #

BACKGROUND_COLOR="#232E37"   # Background Color
FOREGROUND_COLOR="#d9e6f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
