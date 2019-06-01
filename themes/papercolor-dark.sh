#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1C1C1C"           # Black
export COLOR_02="#AF005F"           # Red
export COLOR_03="#5FAF00"           # Green
export COLOR_04="#D7AF5F"           # Yellow
export COLOR_05="#5FAFD7"           # Blue
export COLOR_06="#808080"           # Magenta
export COLOR_07="#D7875F"           # Cyan
export COLOR_08="#D0D0D0"           # Light gray

export COLOR_09="#585858"           # Dark gray
export COLOR_10="#5FAF5F"           # Light Red
export COLOR_11="#AFD700"           # Light Green
export COLOR_12="#AF87D7"           # Light Yellow
export COLOR_13="#FFAF00"           # Light Blue
export COLOR_14="#FF5FAF"           # Light Magenta
export COLOR_15="#00AFAF"           # Light Cyan
export COLOR_16="#5F8787"           # White

export BACKGROUND_COLOR="#1C1C1C"   # Background Color
export FOREGROUND_COLOR="#D0D0D0"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="PaperColor Dark"
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
