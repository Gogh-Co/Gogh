#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1D1F21"           # Black
export COLOR_02="#CC342B"           # Red
export COLOR_03="#198844"           # Green
export COLOR_04="#FBA922"           # Yellow
export COLOR_05="#3971ED"           # Blue
export COLOR_06="#A36AC7"           # Cyan
export COLOR_07="#3971ED"           # Magenta
export COLOR_08="#C5C8C6"           # Light gray

export COLOR_09="#969896"           # Dark gray
export COLOR_10="#CC342B"           # Light Red
export COLOR_11="#198844"           # Light Green
export COLOR_12="#FBA922"           # Light Yellow
export COLOR_13="#3971ED"           # Light Blue
export COLOR_14="#A36AC7"           # Light Cyan
export COLOR_15="#3971ED"           # Light Magenta
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#1D1F21"   # Background Color
export FOREGROUND_COLOR="#B4B7B4"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="base16: Google (dark)"
# =============================================







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
