#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#16161C"           # Black
export COLOR_02="#DA103F"           # Red
export COLOR_03="#1EB980"           # Green
export COLOR_04="#F6661E"           # Yellow
export COLOR_05="#26BBD9"           # Blue
export COLOR_06="#EE64AE"           # Magenta
export COLOR_07="#1D8991"           # Cyan
export COLOR_08="#FADAD1"           # Light gray

export COLOR_09="#1A1C23"           # Dark gray
export COLOR_10="#F43E5C"           # Light Red
export COLOR_11="#07DA8C"           # Light Green
export COLOR_12="#F77D26"           # Light Yellow
export COLOR_13="#3FC6DE"           # Light Blue
export COLOR_14="#F075B7"           # Light Magenta
export COLOR_15="#1EAEAE"           # Light Cyan
export COLOR_16="#FDF0ED"           # White

export BACKGROUND_COLOR="#FDF0ED"   # Background Color
export FOREGROUND_COLOR="#1C1E26"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Horizon Bright"
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
