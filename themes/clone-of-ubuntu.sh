#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2E3436"           # Black
export COLOR_02="#CC0000"           # Red
export COLOR_03="#4E9A06"           # Green
export COLOR_04="#C4A000"           # Yellow
export COLOR_05="#3465A4"           # Blue
export COLOR_06="#75507B"           # Cyan
export COLOR_07="#06989A"           # Magenta
export COLOR_08="#D3D7CF"           # Light gray

export COLOR_09="#555753"           # Dark gray
export COLOR_10="#EF2929"           # Light Red
export COLOR_11="#8AE234"           # Light Green
export COLOR_12="#FCE94F"           # Light Yellow
export COLOR_13="#729FCF"           # Light Blue
export COLOR_14="#AD7FA8"           # Light Cyan
export COLOR_15="#34E2E2"           # Light Magenta
export COLOR_16="#EEEEEC"           # White

export BACKGROUND_COLOR="#300a24"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Clone of Ubuntu"
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
