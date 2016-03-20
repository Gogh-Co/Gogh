#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"          # HOST
COLOR_02="#C75646"          # SYNTAX_STRING
COLOR_03="#8EB33B"          # COMMAND
COLOR_04="#D0B03C"          # COMMAND_COLOR2
COLOR_05="#72B3CC"          # PATH
COLOR_06="#C8A0D1"          # SYNTAX_VAR
COLOR_07="#218693"          # PROMP
COLOR_08="#B0B0B0"          #

COLOR_09="#5D5D5D"          #
COLOR_10="#E09690"          # COMMAND_ERROR
COLOR_11="#CDEE69"          # EXEC
COLOR_12="#FFE377"          #
COLOR_13="#9CD9F0"          # FOLDER
COLOR_14="#FBB1F9"          #
COLOR_15="#77DFD8"          #
COLOR_16="#F7F7F7"          #

BACKGROUND_COLOR="#242424"  # Background Color
FOREGROUND_COLOR="#F7F7F7"  # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)

