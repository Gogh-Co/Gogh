#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#292A2B"           # Black
export COLOR_02="#FF2B6C"           # Red
export COLOR_03="#14FBDC"           # Green
export COLOR_04="#FFB76B"           # Yellow
export COLOR_05="#6DB1FE"           # Blue
export COLOR_06="#FF74B5"           # Magenta
export COLOR_07="#15FBDC"           # Cyan
export COLOR_08="#F3F3F3"           # Light gray

export COLOR_09="#6F7683"           # Dark gray
export COLOR_10="#FF2B6C"           # Light Red
export COLOR_11="#14FBDC"           # Light Green
export COLOR_12="#FFC88F"           # Light Yellow
export COLOR_13="#65BCFE"           # Light Blue
export COLOR_14="#FFAAD9"           # Light Magenta
export COLOR_15="#15FBDC"           # Light Cyan
export COLOR_16="#F3F3F3"           # White

export BACKGROUND_COLOR="#25282A"   # Background Color
export FOREGROUND_COLOR="#F3F3F3"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="_bash"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://github.com/Jangrie/Gogh/tree/add-panda-theme"}


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
