#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#020202"           # Black
export COLOR_02="#CD3232"           # Red
export COLOR_03="#00BC00"           # Green
export COLOR_04="#A5A900"           # Yellow
export COLOR_05="#0752A8"           # Blue
export COLOR_06="#BC05BC"           # Magenta
export COLOR_07="#0598BC"           # Cyan
export COLOR_08="#343434"           # Light gray

export COLOR_09="#5E5E5E"           # Dark gray
export COLOR_10="#cd3333"           # Light Red
export COLOR_11="#1BCE1A"           # Light Green
export COLOR_12="#ADBB5B"           # Light Yellow
export COLOR_13="#0752A8"           # Light Blue
export COLOR_14="#C451CE"           # Light Magenta
export COLOR_15="#52A8C7"           # Light Cyan
export COLOR_16="#A6A3A6"           # White

export BACKGROUND_COLOR="#f9f9f9"   # Background Color
export FOREGROUND_COLOR="#020202"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="VS Code Light+"
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
