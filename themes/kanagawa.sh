#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#090618"           # Black
export COLOR_02="#C34043"           # Red
export COLOR_03="#76946A"           # Green
export COLOR_04="#C0A36E"           # Yellow
export COLOR_05="#7E9CD8"           # Blue
export COLOR_06="#957FB8"           # Magenta
export COLOR_07="#6A9589"           # Cyan
export COLOR_08="#DCD7BA"           # Light gray

export COLOR_09="#727169"           # Dark gray
export COLOR_10="#E82424"           # Light Red
export COLOR_11="#98BB6C"           # Light Green
export COLOR_12="#E6C384"           # Light Yellow
export COLOR_13="#7FB4CA"           # Light Blue
export COLOR_14="#938AA9"           # Light Magenta
export COLOR_15="#7AA89F"           # Light Cyan
export COLOR_16="#C8C093"           # White

export BACKGROUND_COLOR="#1F1F28"   # Background Color
export FOREGROUND_COLOR="#DCD7BA"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="kanagawa"
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
