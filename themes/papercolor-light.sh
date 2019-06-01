#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#EEEEEE"           # Black
export COLOR_02="#AF0000"           # Red
export COLOR_03="#008700"           # Green
export COLOR_04="#5F8700"           # Yellow
export COLOR_05="#0087AF"           # Blue
export COLOR_06="#878787"           # Magenta
export COLOR_07="#005F87"           # Cyan
export COLOR_08="#444444"           # Light gray

export COLOR_09="#BCBCBC"           # Dark gray
export COLOR_10="#D70000"           # Light Red
export COLOR_11="#D70087"           # Light Green
export COLOR_12="#8700AF"           # Light Yellow
export COLOR_13="#D75F00"           # Light Blue
export COLOR_14="#D75F00"           # Light Magenta
export COLOR_15="#005FAF"           # Light Cyan
export COLOR_16="#005F87"           # White

export BACKGROUND_COLOR="#EEEEEE"   # Background Color
export FOREGROUND_COLOR="#444444"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="PaperColor Light"
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
