#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#16161C"           # Black
export COLOR_02="#E95678"           # Red
export COLOR_03="#29D398"           # Green
export COLOR_04="#FAB795"           # Yellow
export COLOR_05="#26BBD9"           # Blue
export COLOR_06="#EE64AE"           # Magenta
export COLOR_07="#59E3E3"           # Cyan
export COLOR_08="#FADAD1"           # Light gray

export COLOR_09="#232530"           # Dark gray
export COLOR_10="#EC6A88"           # Light Red
export COLOR_11="#3FDAA4"           # Light Green
export COLOR_12="#FBC3A7"           # Light Yellow
export COLOR_13="#3FC6DE"           # Light Blue
export COLOR_14="#F075B7"           # Light Magenta
export COLOR_15="#6BE6E6"           # Light Cyan
export COLOR_16="#FDF0ED"           # White

export BACKGROUND_COLOR="#1C1E26"   # Background Color
export FOREGROUND_COLOR="#FDF0ED"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Horizon Dark"
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
