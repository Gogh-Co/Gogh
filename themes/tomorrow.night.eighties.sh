#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#F27779"
COLOR_03="#99CC99"
COLOR_04="#FFCC66"
COLOR_05="#6699CC"
COLOR_06="#CC99CC"
COLOR_07="#66CCCC"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#F17779"
COLOR_11="#99CC99"
COLOR_12="#FFCC66"
COLOR_13="#6699CC"
COLOR_14="#CC99CC"
COLOR_15="#66CCCC"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#2C2C2C"
FOREGROUND_COLOR="#CCCCCC"
CURSOR_COLOR="#CCCCCC"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
