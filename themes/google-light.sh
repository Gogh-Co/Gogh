#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#FFFFFF"           # Black
export COLOR_02="#CC342B"           # Red
export COLOR_03="#198844"           # Green
export COLOR_04="#FBA921"           # Yellow
export COLOR_05="#3870ED"           # Blue
export COLOR_06="#A26AC7"           # Cyan
export COLOR_07="#3870ED"           # Magenta
export COLOR_08="#373B41"           # Light gray

export COLOR_09="#C5C8C6"           # Dark gray
export COLOR_10="#CC342B"           # Light Red
export COLOR_11="#198844"           # Light Green
export COLOR_12="#FBA921"           # Light Yellow
export COLOR_13="#3870ED"           # Light Blue
export COLOR_14="#A26AC7"           # Light Cyan
export COLOR_15="#3870ED"           # Light Magenta
export COLOR_16="#1D1F21"           # White

export BACKGROUND_COLOR="#FFFFFF"   # Background Color
export FOREGROUND_COLOR="#969896"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="base16: Google (light)"
# =============================================







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
  bash "${PARENT_PATH}/apply-colors.sh"
else
  if [[ "$(uname)" = "Darwin" ]]; then
    # OSX ships with curl and ancient bash
    (eval "$(curl -so- "${BASE_URL}/apply-colors.sh")")
  else
    # Linux ships with wget
    (eval "$(wget -qO- "${BASE_URL}/apply-colors.sh")")
  fi
fi