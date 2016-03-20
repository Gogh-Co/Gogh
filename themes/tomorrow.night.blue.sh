#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#FF9DA3"
COLOR_03="#D1F1A9"
COLOR_04="#FFEEAD"
COLOR_05="#BBDAFF"
COLOR_06="#EBBBFF"
COLOR_07="#99FFFF"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#FF9CA3"
COLOR_11="#D0F0A8"
COLOR_12="#FFEDAC"
COLOR_13="#BADAFF"
COLOR_14="#EBBAFF"
COLOR_15="#99FFFF"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#002451"
FOREGROUND_COLOR="#FFFEFE"
CURSOR_COLOR="#FFFEFE"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
