#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282C34"           # Black
export COLOR_02="#ED254E"           # Red
export COLOR_03="#71F79F"           # Green
export COLOR_04="#F9DC5C"           # Yellow
export COLOR_05="#7CB7FF"           # Blue
export COLOR_06="#C74DED"           # Magenta
export COLOR_07="#00C1E4"           # Cyan
export COLOR_08="#DCDFE4"           # Light gray

export COLOR_09="#282C34"           # Dark gray
export COLOR_10="#ED254E"           # Light Red
export COLOR_11="#71F79F"           # Light Green
export COLOR_12="#F9DC5C"           # Light Yellow
export COLOR_13="#7CB7FF"           # Light Blue
export COLOR_14="#C74DED"           # Light Magenta
export COLOR_15="#00C1E4"           # Light Cyan
export COLOR_16="#DCDFE4"           # White

export BACKGROUND_COLOR="#282C34"   # Background Color
export FOREGROUND_COLOR="#C3C7D1"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="sweet-eliverlara"
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
