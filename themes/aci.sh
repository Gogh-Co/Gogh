#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#363636"          # HOST
COLOR_02="#ff0883"          # SYNTAX_STRING
COLOR_03="#83ff08"          # COMMAND
COLOR_04="#ff8308"          # COMMAND_COLOR2
COLOR_05="#0883ff"          # PATH
COLOR_06="#8308ff"          # SYNTAX_VAR
COLOR_07="#08ff83"          # PROMP
COLOR_08="#b6b6b6"          #

COLOR_09="#424242"          #
COLOR_10="#ff1e8e"          # COMMAND_ERROR
COLOR_11="#8eff1e"          # EXEC
COLOR_12="#ff8e1e"          #
COLOR_13="#1e8eff"          # FOLDER
COLOR_14="#8e1eff"          #
COLOR_15="#1eff8e"          #
COLOR_16="#c2c2c2"          #

BACKGROUND_COLOR="#0d1926"  # Background Color
FOREGROUND_COLOR="#b4e1fd"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
