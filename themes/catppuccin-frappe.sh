#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#51576D"           # Black
export COLOR_02="#E78284"           # Red
export COLOR_03="#A6D189"           # Green
export COLOR_04="#E5C890"           # Yellow
export COLOR_05="#8CAAEE"           # Blue
export COLOR_06="#F4B8E4"           # Magenta
export COLOR_07="#81C8BE"           # Cyan
export COLOR_08="#B5BFE2"           # Light gray

export COLOR_09="#626880"           # Dark gray
export COLOR_10="#E78284"           # Light Red
export COLOR_11="#A6D189"           # Light Green
export COLOR_12="#E5C890"           # Light Yellow
export COLOR_13="#8CAAEE"           # Light Blue
export COLOR_14="#F4B8E4"           # Light Magenta
export COLOR_15="#81C8BE"           # Light Cyan
export COLOR_16="#A5ADCE"           # White

export BACKGROUND_COLOR="#303446"   # Background Color
export FOREGROUND_COLOR="#C6D0F5"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Catppuccin Frappé"
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
