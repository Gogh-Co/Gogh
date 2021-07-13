#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#414868"           # Black
export COLOR_02="#f7768e"           # Red
export COLOR_03="#9ece6a"           # Green
export COLOR_04="#e0af68"           # Yellow
export COLOR_05="#7aa2f7"           # Blue
export COLOR_06="#bb9af7"           # Magenta
export COLOR_07="#7dcfff"           # Cyan
export COLOR_08="#a9b1d6"           # Light gray

export COLOR_09="#414868"           # Dark gray
export COLOR_10="#f7768e"           # Light Red
export COLOR_11="#9ece6a"           # Light Green
export COLOR_12="#e0af68"           # Light Yellow
export COLOR_13="#7aa2f7"           # Light Blue
export COLOR_14="#bb9af7"           # Light Magenta
export COLOR_15="#7dcfff"           # Light Cyan
export COLOR_16="#c0caf5"           # White

export BACKGROUND_COLOR="#1a1b26"   # Background Color
export FOREGROUND_COLOR="#c0caf5"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Tokyo Night"
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
