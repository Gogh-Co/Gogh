#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#5C6A72"           # Black
export COLOR_02="#F85552"           # Red
export COLOR_03="#8DA101"           # Green
export COLOR_04="#DFA000"           # Yellow
export COLOR_05="#3A94C5"           # Blue
export COLOR_06="#DF69BA"           # Magenta
export COLOR_07="#35A77C"           # Cyan
export COLOR_08="#DFDDC8"           # Light gray

export COLOR_09="#4B565C"           # Dark gray
export COLOR_10="#E67E80"           # Light Red
export COLOR_11="#A7C080"           # Light Green
export COLOR_12="#DBBC7F"           # Light Yellow
export COLOR_13="#7FBBB3"           # Light Blue
export COLOR_14="#D699B6"           # Light Magenta
export COLOR_15="#83C092"           # Light Cyan
export COLOR_16="#D3C6AA"           # White

export BACKGROUND_COLOR="#FDF6E3"   # Background Color
export FOREGROUND_COLOR="#5C6A72"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Everforest Light"
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
