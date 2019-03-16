#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#003340"           # Black
export COLOR_02="#00CCFF"           # Red
export COLOR_03="#00CCFF"           # Green
export COLOR_04="#00CCFF"           # Yellow
export COLOR_05="#00CCFF"           # Blue
export COLOR_06="#00CCFF"           # Magenta
export COLOR_07="#00CCFF"           # Cyan
export COLOR_08="#00CCFF"           # Light gray

export COLOR_09="#00CCFF"           # Dark gray
export COLOR_10="#00CCFF"           # Light Red
export COLOR_11="#00CCFF"           # Light Green
export COLOR_12="#00CCFF"           # Light Yellow
export COLOR_13="#00CCFF"           # Light Blue
export COLOR_14="#00CCFF"           # Light Magenta
export COLOR_15="#00CCFF"           # Light Cyan
export COLOR_16="#00CCFF"           # White

export BACKGROUND_COLOR="#00222B"   # Background Color
export FOREGROUND_COLOR="#00CCFF"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="mono-cyan"
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
