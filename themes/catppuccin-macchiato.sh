#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#494D64"           # Black
export COLOR_02="#ED8796"           # Red
export COLOR_03="#A6DA95"           # Green
export COLOR_04="#EED49F"           # Yellow
export COLOR_05="#8AADF4"           # Blue
export COLOR_06="#F5BDE6"           # Magenta
export COLOR_07="#8BD5CA"           # Cyan
export COLOR_08="#B8C0E0"           # Light gray

export COLOR_09="#5B6078"           # Dark gray
export COLOR_10="#ED8796"           # Light Red
export COLOR_11="#A6DA95"           # Light Green
export COLOR_12="#EED49F"           # Light Yellow
export COLOR_13="#8AADF4"           # Light Blue
export COLOR_14="#F5BDE6"           # Light Magenta
export COLOR_15="#8BD5CA"           # Light Cyan
export COLOR_16="#A5ADCB"           # White

export BACKGROUND_COLOR="#24273A"   # Background Color
export FOREGROUND_COLOR="#CAD3F5"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Catppuccin Macchiato"
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
