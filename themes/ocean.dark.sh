#!/bin/bash

# ====================CONFIG THIS =============================== #
COLOR_01="#4F4F4F"
COLOR_02="#AF4B57"
COLOR_03="#AFD383"
COLOR_04="#E5C079"
COLOR_05="#7D90A4"
COLOR_06="#A4799D"
COLOR_07="#85A6A5"
COLOR_08="#EEEDEE"

COLOR_09="#7B7B7B"
COLOR_10="#AF4B57"
COLOR_11="#CEFFAB"
COLOR_12="#FFFECC"
COLOR_13="#B5DCFE"
COLOR_14="#FB9BFE"
COLOR_15="#DFDFFD"
COLOR_16="#FEFFFE"

BACKGROUND_COLOR="#1C1F27"
FOREGROUND_COLOR="#979CAC"
CURSOR_COLOR="#979CAC"
# =============================================================== #

# |
# | Apply Colors
# | ===========================================
source $(cd "$(dirname "$(readlink -f "$0")")" && pwd)/../_apply-colors.sh || \
  source <(wget  -O - http://git.io/vY8Qq)
