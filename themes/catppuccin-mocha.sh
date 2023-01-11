#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#45475A"           # Black
export COLOR_02="#F38BA8"           # Red
export COLOR_03="#A6E3A1"           # Green
export COLOR_04="#F9E2AF"           # Yellow
export COLOR_05="#89B4FA"           # Blue
export COLOR_06="#F5C2E7"           # Magenta
export COLOR_07="#94E2D5"           # Cyan
export COLOR_08="#BAC2DE"           # Light gray

export COLOR_09="#585B70"           # Dark gray
export COLOR_10="#F38BA8"           # Light Red
export COLOR_11="#A6E3A1"           # Light Green
export COLOR_12="#F9E2AF"           # Light Yellow
export COLOR_13="#89B4FA"           # Light Blue
export COLOR_14="#F5C2E7"           # Light Magenta
export COLOR_15="#94E2D5"           # Light Cyan
export COLOR_16="#A6ADC8"           # White

export BACKGROUND_COLOR="#1e1e2e"   # Background Color
export FOREGROUND_COLOR="#cdd6f4"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Catppuccin Mocha"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


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
