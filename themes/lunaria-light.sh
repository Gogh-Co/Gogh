#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3E3C3D"           # Black
export COLOR_02="#783C1F"           # Red
export COLOR_03="#497D46"           # Green
export COLOR_04="#8F750B"           # Yellow
export COLOR_05="#3F3566"           # Blue
export COLOR_06="#793F62"           # Magenta
export COLOR_07="#3778A9"           # Cyan
export COLOR_08="#D5CFCC"           # Light gray

export COLOR_09="#484646"           # Dark gray
export COLOR_10="#B06240"           # Light Red
export COLOR_11="#7BC175"           # Light Green
export COLOR_12="#DCB735"           # Light Yellow
export COLOR_13="#5C4F89"           # Light Blue
export COLOR_14="#B56895"           # Light Magenta
export COLOR_15="#64BAFF"           # Light Cyan
export COLOR_16="#EBE4E1"           # White

export BACKGROUND_COLOR="#EBE4E1"   # Background Color
export FOREGROUND_COLOR="#484646"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Lunaria Light"
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
