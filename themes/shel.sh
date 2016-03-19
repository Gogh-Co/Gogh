#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c2423"           # HOST
COLOR_02="#ab2463"           # SYNTAX_STRING
COLOR_03="#6ca323"           # COMMAND
COLOR_04="#ab6423"           # COMMAND_COLOR2
COLOR_05="#2c64a2"           # PATH
COLOR_06="#6c24a2"           # SYNTAX_VAR
COLOR_07="#2ca363"           # PROMP
COLOR_08="#918988"           #

COLOR_09="#918988"           #
COLOR_10="#f588b9"           # COMMAND_ERROR
COLOR_11="#c2ee86"           # EXEC
COLOR_12="#f5ba86"           #
COLOR_13="#8fbaec"           # FOLDER
COLOR_14="#c288ec"           #
COLOR_15="#8feeb9"           #
COLOR_16="#f5eeec"           #

BACKGROUND_COLOR="#2a201f"   # Background Color
FOREGROUND_COLOR="#4882cd"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
