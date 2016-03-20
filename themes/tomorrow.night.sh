#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"
COLOR_02="#CC6666"
COLOR_03="#B5BD68"
COLOR_04="#F0C674"
COLOR_05="#81A2BE"
COLOR_06="#B293BB"
COLOR_07="#8ABEB7"
COLOR_08="#FFFEFE"

COLOR_09="#000000"
COLOR_10="#CC6666"
COLOR_11="#B5BD68"
COLOR_12="#F0C574"
COLOR_13="#80A1BD"
COLOR_14="#B294BA"
COLOR_15="#8ABDB6"
COLOR_16="#FFFEFE"

BACKGROUND_COLOR="#1D1F21"
FOREGROUND_COLOR="#C5C8C6"
CURSOR_COLOR="#C4C8C5"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
