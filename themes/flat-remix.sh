#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1F2229"           # Black
export COLOR_02="#D41919"           # Red
export COLOR_03="#5EBDAB"           # Green
export COLOR_04="#FEA44C"           # Yellow
export COLOR_05="#367bf0"           # Blue
export COLOR_06="#BF2E5D"           # Magenta
export COLOR_07="#49AEE6"           # Cyan
export COLOR_08="#E6E6E6"           # Light gray

export COLOR_09="#8C42AB"           # Dark gray
export COLOR_10="#EC0101"           # Light Red
export COLOR_11="#47D4B9"           # Light Green
export COLOR_12="#FF8A18"           # Light Yellow
export COLOR_13="#277FFF"           # Light Blue
export COLOR_14="#D71655"           # Light Magenta
export COLOR_15="#05A1F7"           # Light Cyan
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#272a34"   # Background Color
export FOREGROUND_COLOR="#FFFFFF"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Flat Remix"
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
