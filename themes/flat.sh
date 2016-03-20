#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c3e50"           # HOST
COLOR_02="#c0392b"           # SYNTAX_STRING
COLOR_03="#27ae60"           # COMMAND
COLOR_04="#f39c12"           # COMMAND_COLOR2
COLOR_05="#2980b9"           # PATH
COLOR_06="#8e44ad"           # SYNTAX_VAR
COLOR_07="#16a085"           # PROMP
COLOR_08="#bdc3c7"           #

COLOR_09="#34495e"           #
COLOR_10="#e74c3c"           # COMMAND_ERROR
COLOR_11="#2ecc71"           # EXEC
COLOR_12="#f1c40f"           #
COLOR_13="#3498db"           # FOLDER
COLOR_14="#9b59b6"           #
COLOR_15="#2AA198"           #
COLOR_16="#ecf0f1"           #

BACKGROUND_COLOR="#1F2D3A"   # Background Color
FOREGROUND_COLOR="#1abc9c"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
