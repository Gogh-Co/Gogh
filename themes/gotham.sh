#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="0a/0f/14" # Base 00 - Black
export COLOR_02="c3/30/27" # Base 08 - Red
export COLOR_03="26/a9/8b" # Base 0B - Green
export COLOR_04="ed/b5/4b" # Base 0A - Yellow
export COLOR_05="19/54/65" # Base 0D - Blue
export COLOR_06="4e/51/65" # Base 0E - Magenta
export COLOR_07="33/85/9d" # Base 0C - Cyan
export COLOR_08="98/d1/ce" # Base 05 - White

export COLOR_09="10/15/1b" # Base 03 - Bright Black
export COLOR_10="d2/69/39" # Base 08 - Bright Red
export COLOR_11="08/1f/2d" # Base 0B - Bright Green
export COLOR_12="24/53/61" # Base 0A - Bright Yellow
export COLOR_13="09/37/48" # Base 0D - Bright Blue
export COLOR_14="88/8b/a5" # Base 0E - Bright Magenta
export COLOR_15="59/9c/aa" # Base 0C - Bright Cyan
export COLOR_16="d3/eb/e9" # Base 07 - Bright White

export FOREGROUND_COLOR="98/d1/ce" # Base 05
export BACKGROUND_COLOR="0a/0f/14" # Base 00
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
