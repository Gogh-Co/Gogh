#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#353535"
COLOR_02="#E64569"
COLOR_03="#89D287"
COLOR_04="#DAB752"
COLOR_05="#439ECF"
COLOR_06="#D961DC"
COLOR_07="#64AAAF"
COLOR_08="#B3B3B3"

COLOR_09="#535353"
COLOR_10="#E4859A"
COLOR_11="#A2CCA1"
COLOR_12="#E1E387"
COLOR_13="#6FBBE2"
COLOR_14="#E586E7"
COLOR_15="#96DCDA"
COLOR_16="#DEDEDE"

BACKGROUND_COLOR="#000000"
FOREGROUND_COLOR="#C7C7C7"
CURSOR_COLOR="#BBBBBB"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
