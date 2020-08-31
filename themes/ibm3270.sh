#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#222222"           # Black
export COLOR_02="#F01818"           # Red
export COLOR_03="#24D830"           # Green
export COLOR_04="#F0D824"           # Yellow
export COLOR_05="#7890F0"           # Blue
export COLOR_06="#F078D8"           # Magenta
export COLOR_07="#54E4E4"           # Cyan
export COLOR_08="#A5A5A5"           # Light gray

export COLOR_09="#888888"           # Dark gray
export COLOR_10="#EF8383"           # Light Red
export COLOR_11="#7ED684"           # Light Green
export COLOR_12="#EFE28B"           # Light Yellow
export COLOR_13="#B3BFEF"           # Light Blue
export COLOR_14="#EFB3E3"           # Light Magenta
export COLOR_15="#9CE2E2"           # Light Cyan
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#FDFDFD"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="ibm3270"
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
