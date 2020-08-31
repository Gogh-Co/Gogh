#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#0a0f14" # Base 00 - Black
export COLOR_02="#c33027" # Base 08 - Red
export COLOR_03="#26a98b" # Base 0B - Green
export COLOR_04="#edb54b" # Base 0A - Yellow
export COLOR_05="#195465" # Base 0D - Blue
export COLOR_06="#4e5165" # Base 0E - Magenta
export COLOR_07="#33859d" # Base 0C - Cyan
export COLOR_08="#98d1ce" # Base 05 - White

export COLOR_09="#10151b" # Base 03 - Bright Black
export COLOR_10="#d26939" # Base 08 - Bright Red
export COLOR_11="#081f2d" # Base 0B - Bright Green
export COLOR_12="#245361" # Base 0A - Bright Yellow
export COLOR_13="#093748" # Base 0D - Bright Blue
export COLOR_14="#888ba5" # Base 0E - Bright Magenta
export COLOR_15="#599caa" # Base 0C - Bright Cyan
export COLOR_16="#d3ebe9" # Base 07 - Bright White

export FOREGROUND_COLOR="#98d1ce" # Base 05
export BACKGROUND_COLOR="#0a0f14" # Base 00
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="gotham"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
  else
    # Linux ships with wget
    bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
  fi
fi
