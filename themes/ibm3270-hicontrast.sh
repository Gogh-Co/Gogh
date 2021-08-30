#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # Black
export COLOR_02="#FF0000"           # Red
export COLOR_03="#00FF00"           # Green
export COLOR_04="#FFFF00"           # Yellow
export COLOR_05="#00BFFF"           # Blue
export COLOR_06="#FFC0CB"           # Magenta
export COLOR_07="#40E0D0"           # Cyan
export COLOR_08="#BEBEBE"           # Light gray

export COLOR_09="#414141"           # Dark gray
export COLOR_10="#FFA500"           # Light Red
export COLOR_11="#98FB98"           # Light Green
export COLOR_12="#FFFF00"           # Light Yellow
export COLOR_13="#0000CD"           # Light Blue
export COLOR_14="#A020F0"           # Light Magenta
export COLOR_15="#AEEEEE"           # Light Cyan
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#FDFDFD"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="IBM 3270 (High Contrast)"
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
