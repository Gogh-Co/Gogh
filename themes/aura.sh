#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#110f18"           # Black
export COLOR_02="#ff6767"           # Red
export COLOR_03="#61ffca"           # Green
export COLOR_04="#ffca85"           # Yellow
export COLOR_05="#a277ff"           # Blue
export COLOR_06="#a277ff"           # Magenta
export COLOR_07="#61ffca"           # Cyan
export COLOR_08="#edecee"           # Light gray

export COLOR_09="#6d6d6d"           # Dark gray
export COLOR_10="#ffca85"           # Light Red
export COLOR_11="#a277ff"           # Light Green
export COLOR_12="#ffca85"           # Light Yellow
export COLOR_13="#a277ff"           # Light Blue
export COLOR_14="#a277ff"           # Light Magenta
export COLOR_15="#61ffca"           # Light Cyan
export COLOR_16="#edecee"           # White

export BACKGROUND_COLOR="#15141B"   # Background Color
export FOREGROUND_COLOR="#edecee"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Aura"
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
