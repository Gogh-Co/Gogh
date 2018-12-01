#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#373D48"           # Black
export COLOR_02="#9B3E46"           # Red
export COLOR_03="#095B32"           # Green
export COLOR_04="#808020"           # Yellow
export COLOR_05="#1D3E6F"           # Blue
export COLOR_06="#823065"           # Cyan
export COLOR_07="#3A7458"           # Magenta
export COLOR_08="#828282"           # Light gray

export COLOR_09="#5C6370"           # Dark gray
export COLOR_10="#D0555F"           # Light Red
export COLOR_11="#119955"           # AM77 Green
export COLOR_12="#DFE048"           # Light Yellow
export COLOR_13="#4674B8"           # Light Blue
export COLOR_14="#ED86C9"           # Light Cyan
export COLOR_15="#70D2A4"           # Light Magenta
export COLOR_16="#DFDFDF"           # White

export BACKGROUND_COLOR="#2F2F2F"   # Background Color
export FOREGROUND_COLOR="#DFDFDF"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="nighty"
# =============================================







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
