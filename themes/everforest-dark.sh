#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#4B565C"           # Black
export COLOR_02="#E67E80"           # Red
export COLOR_03="#A7C080"           # Green
export COLOR_04="#DBBC7F"           # Yellow
export COLOR_05="#7FBBB3"           # Blue
export COLOR_06="#D699B6"           # Magenta
export COLOR_07="#83C092"           # Cyan
export COLOR_08="#D3C6AA"           # Light gray

export COLOR_09="#5C6A72"           # Dark gray
export COLOR_10="#F85552"           # Light Red
export COLOR_11="#8DA101"           # Light Green
export COLOR_12="#DFA000"           # Light Yellow
export COLOR_13="#3A94C5"           # Light Blue
export COLOR_14="#DF69BA"           # Light Magenta
export COLOR_15="#35A77C"           # Light Cyan
export COLOR_16="#DFDDC8"           # White

export BACKGROUND_COLOR="#2F383E"   # Background Color
export FOREGROUND_COLOR="#D3C6AA"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Everforest Dark"
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
