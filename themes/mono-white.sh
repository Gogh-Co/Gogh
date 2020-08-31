#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3B3B3B"           # Black
export COLOR_02="#FAFAFA"           # Red
export COLOR_03="#FAFAFA"           # Green
export COLOR_04="#FAFAFA"           # Yellow
export COLOR_05="#FAFAFA"           # Blue
export COLOR_06="#FAFAFA"           # Magenta
export COLOR_07="#FAFAFA"           # Cyan
export COLOR_08="#FAFAFA"           # Light gray

export COLOR_09="#FAFAFA"           # Dark gray
export COLOR_10="#FAFAFA"           # Light Red
export COLOR_11="#FAFAFA"           # Light Green
export COLOR_12="#FAFAFA"           # Light Yellow
export COLOR_13="#FAFAFA"           # Light Blue
export COLOR_14="#FAFAFA"           # Light Magenta
export COLOR_15="#FAFAFA"           # Light Cyan
export COLOR_16="#FAFAFA"           # White

export BACKGROUND_COLOR="#262626"   # Background Color
export FOREGROUND_COLOR="#FAFAFA"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="mono-white"
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
