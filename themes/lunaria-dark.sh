#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#36464E"           # Black
export COLOR_02="#846560"           # Red
export COLOR_03="#809984"           # Green
export COLOR_04="#A79A79"           # Yellow
export COLOR_05="#555673"           # Blue
export COLOR_06="#866C83"           # Magenta
export COLOR_07="#7E98B4"           # Cyan
export COLOR_08="#CACED8"           # Light gray

export COLOR_09="#404F56"           # Dark gray
export COLOR_10="#BB928B"           # Light Red
export COLOR_11="#BFDCC2"           # Light Green
export COLOR_12="#F1DFB6"           # Light Yellow
export COLOR_13="#777798"           # Light Blue
export COLOR_14="#BF9DB9"           # Light Magenta
export COLOR_15="#BDDCFF"           # Light Cyan
export COLOR_16="#DFE2ED"           # White

export BACKGROUND_COLOR="#36464E"   # Background Color
export FOREGROUND_COLOR="#CACED8"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Lunaria Dark"
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
