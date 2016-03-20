#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#75715e"           # HOST
COLOR_02="#f92672"           # SYNTAX_STRING
COLOR_03="#a6e22e"           # COMMAND
COLOR_04="#f4bf75"           # COMMAND_COLOR2
COLOR_05="#66d9ef"           # PATH
COLOR_06="#ae81ff"           # SYNTAX_VAR
COLOR_07="#2AA198"           # PROMP
COLOR_08="#f9f8f5"           #

COLOR_09="#272822"           #
COLOR_10="#f92672"           # COMMAND_ERROR
COLOR_11="#a6e22e"           # EXEC
COLOR_12="#f4bf75"           #
COLOR_13="#66d9ef"           # FOLDER
COLOR_14="#ae81ff"           #
COLOR_15="#2AA198"           #
COLOR_16="#f8f8f2"           #

BACKGROUND_COLOR="#272822"   # Background Color
FOREGROUND_COLOR="#f8f8f2"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
