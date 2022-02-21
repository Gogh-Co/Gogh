#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
# Regular text
export COLOR_01="#2C2E34"           # Dark Gray
export COLOR_02="#FC5D7C"           # Sonokai Red
export COLOR_03="#9ED072"           # Sonokai Green
export COLOR_04="#E7C664"           # Sonokai Yellow
export COLOR_05="#F39660"           # Sonokai Orange
export COLOR_06="#B39DF3"           # Sonokai Magenta
export COLOR_07="#76CCE0"           # Sonokai Cyan
export COLOR_08="#E2E2E3"           # Light Gray
# Bold text
export COLOR_09="#7F8490"           # Gray
export COLOR_10="#FC5D7C"           # Sonokai Red
export COLOR_11="#9ED072"           # Sonokai Green
export COLOR_12="#E7C664"           # Sonokai Yellow
export COLOR_13="#F39660"           # Sonokai Orange
export COLOR_14="#B39DF3"           # Sonokai Magenta
export COLOR_15="#76CCE0"           # Sonokai Cyan
export COLOR_16="#E2E2E3"           # Light Gray
# Text and background
export BACKGROUND_COLOR="#2C2E34"   # Background Color
export FOREGROUND_COLOR="#E2E2E3"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Sonokai"
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
