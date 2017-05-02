#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535" #black
COLOR_02="#E64569" #red
COLOR_03="#89D287" #green
COLOR_04="#DAB752" #yellow
COLOR_05="#439ECF" #blue
COLOR_06="#D961DC" #magenta
COLOR_07="#64AAAF" #cyan
COLOR_08="#B3B3B3" #white

COLOR_09="#535353" #lightBlack
COLOR_10="#E4859A" #lightRed
COLOR_11="#A2CCA1" #lightGreen
COLOR_12="#E1E387" #lightYellow
COLOR_13="#6FBBE2" #lightBlue
COLOR_14="#E586E7" #lightMagenta
COLOR_15="#96DCDA" #lightCyan
COLOR_16="#DEDEDE" #lightWhite

BACKGROUND_COLOR=$COLOR_01
FOREGROUND_COLOR=$COLOR_05
CURSOR_COLOR=$COLOR_05
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)

