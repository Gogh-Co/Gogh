#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#5C5F77"           # Black
export COLOR_02="#D20F39"           # Red
export COLOR_03="#40A02B"           # Green
export COLOR_04="#DF8E1D"           # Yellow
export COLOR_05="#1E66F5"           # Blue
export COLOR_06="#EA76CB"           # Magenta
export COLOR_07="#179299"           # Cyan
export COLOR_08="#ACB0BE"           # Light gray

export COLOR_09="#6C6F85"           # Dark gray
export COLOR_10="#D20F39"           # Light Red
export COLOR_11="#40A02B"           # Light Green
export COLOR_12="#DF8E1D"           # Light Yellow
export COLOR_13="#1E66F5"           # Light Blue
export COLOR_14="#EA76CB"           # Light Magenta
export COLOR_15="#179299"           # Light Cyan
export COLOR_16="#BCC0CC"           # White

export BACKGROUND_COLOR="#EFF1F5"   # Background Color
export FOREGROUND_COLOR="#4C4F69"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Catppuccin Latte"
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
