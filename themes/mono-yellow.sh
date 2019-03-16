#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#403500"           # Black
export COLOR_02="#FFD300"           # Red
export COLOR_03="#FFD300"           # Green
export COLOR_04="#FFD300"           # Yellow
export COLOR_05="#FFD300"           # Blue
export COLOR_06="#FFD300"           # Magenta
export COLOR_07="#FFD300"           # Cyan
export COLOR_08="#FFD300"           # Light gray

export COLOR_09="#FFD300"           # Dark gray
export COLOR_10="#FFD300"           # Light Red
export COLOR_11="#FFD300"           # Light Green
export COLOR_12="#FFD300"           # Light Yellow
export COLOR_13="#FFD300"           # Light Blue
export COLOR_14="#FFD300"           # Light Magenta
export COLOR_15="#FFD300"           # Light Cyan
export COLOR_16="#FFD300"           # White

export BACKGROUND_COLOR="#2B2400"   # Background Color
export FOREGROUND_COLOR="#FFD300"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="mono-yellow"
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
