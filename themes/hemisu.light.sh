#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#777777"
COLOR_02="#FF0055"
COLOR_03="#739100"
COLOR_04="#503D15"
COLOR_05="#538091"
COLOR_06="#5B345E"
COLOR_07="#538091"
COLOR_08="#999999"

COLOR_09="#999999"
COLOR_10="#D65E76"
COLOR_11="#9CC700"
COLOR_12="#947555"
COLOR_13="#9DB3CD"
COLOR_14="#A184A4"
COLOR_15="#85B2AA"
COLOR_16="#BABABA"

BACKGROUND_COLOR="#EFEFEF"
FOREGROUND_COLOR="#444444"
CURSOR_COLOR="#FF0054"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
