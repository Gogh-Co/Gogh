#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#2c2423"           # HOST
COLOR_02="#f557a0"           # SYNTAX_STRING
COLOR_03="#a9ee55"           # COMMAND
COLOR_04="#f5a255"           # COMMAND_COLOR2
COLOR_05="#5ea2ec"           # PATH
COLOR_06="#a957ec"           # SYNTAX_VAR
COLOR_07="#5eeea0"           # PROMP
COLOR_08="#918988"           #

COLOR_09="#918988"           #
COLOR_10="#f579b2"           # COMMAND_ERROR
COLOR_11="#bbee78"           # EXEC
COLOR_12="#f5b378"           #
COLOR_13="#81b3ec"           # FOLDER
COLOR_14="#bb79ec"           #
COLOR_15="#81eeb2"           #
COLOR_16="#f5eeec"           #

BACKGROUND_COLOR="#012849"   # Background Color
FOREGROUND_COLOR="#a9bed8"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
