#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#303030"          # HOST
COLOR_02="#a87139"          # SYNTAX_STRING
COLOR_03="#39a871"          # COMMAND
COLOR_04="#71a839"          # COMMAND_COLOR2
COLOR_05="#7139a8"          # PATH
COLOR_06="#a83971"          # SYNTAX_VAR
COLOR_07="#3971a8"          # PROMP
COLOR_08="#8a8a8a"          #

COLOR_09="#494949"          #
COLOR_10="#b0763b"          # COMMAND_ERROR
COLOR_11="#3bb076"          # EXEC
COLOR_12="#76b03b"          #
COLOR_13="#763bb0"          # FOLDER
COLOR_14="#b03b76"          #
COLOR_15="#3b76b0"          #
COLOR_16="#cfcfcf"          #

BACKGROUND_COLOR="#191f1d"  # Background Color
FOREGROUND_COLOR="#d9e6f2"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
