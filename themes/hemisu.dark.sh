#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#444444"
COLOR_02="#FF0054"
COLOR_03="#B1D630"
COLOR_04="#9D895E"
COLOR_05="#67BEE3"
COLOR_06="#B576BC"
COLOR_07="#569A9F"
COLOR_08="#EDEDED"

COLOR_09="#777777"
COLOR_10="#D65E75"
COLOR_11="#BAFFAA"
COLOR_12="#ECE1C8"
COLOR_13="#9FD3E5"
COLOR_14="#DEB3DF"
COLOR_15="#B6E0E5"
COLOR_16="#FFFFFF"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#FFFFFF"
CURSOR_COLOR="#BAFFAA"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
