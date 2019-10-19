#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2E8744"           # Black
export COLOR_02="#D84E4C"           # Red
export COLOR_03="#95DA5A"           # Green
export COLOR_04="#D6E264"           # Yellow
export COLOR_05="#4B9ED7"           # Blue
export COLOR_06="#945FC5"           # Magenta
export COLOR_07="#D89B25"           # Cyan
export COLOR_08="#D8E2D7"           # Light gray

export COLOR_09="#34934F"           # Dark gray
export COLOR_10="#FF4F59"           # Light Red
export COLOR_11="#AFF56A"           # Light Green
export COLOR_12="#FCFF75"           # Light Yellow
export COLOR_13="#57AEFF"           # Light Blue
export COLOR_14="#AE63E9"           # Light Magenta
export COLOR_15="#FFAA2B"           # Light Cyan
export COLOR_16="#FFFEFE"           # White

export BACKGROUND_COLOR="#0D4A08"   # Background Color
export FOREGROUND_COLOR="#D8E2D7"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="kokuban"
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
