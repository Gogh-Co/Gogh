#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#323F46"           # Black
export COLOR_02="#83615B"           # Red
export COLOR_03="#7F9781"           # Green
export COLOR_04="#A69875"           # Yellow
export COLOR_05="#53516F"           # Blue
export COLOR_06="#856880"           # Magenta
export COLOR_07="#7D96B2"           # Cyan
export COLOR_08="#C9CDD7"           # Light gray

export COLOR_09="#3D4950"           # Dark gray
export COLOR_10="#BA9088"           # Light Red
export COLOR_11="#BEDBC1"           # Light Green
export COLOR_12="#F1DFB4"           # Light Yellow
export COLOR_13="#767495"           # Light Blue
export COLOR_14="#BE9CB8"           # Light Magenta
export COLOR_15="#BCDBFF"           # Light Cyan
export COLOR_16="#DFE2ED"           # White

export BACKGROUND_COLOR="#323F46"   # Background Color
export FOREGROUND_COLOR="#C9CDD7"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Lunaria Eclipse"
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
