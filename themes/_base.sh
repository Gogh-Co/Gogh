#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#44475a"           # Black
export COLOR_02="#ff5555"           # Red
export COLOR_03="#50fa7b"           # Green
export COLOR_04="#ffb86c"           # Yellow
export COLOR_05="#8be9fd"           # Blue
export COLOR_06="#bd93f9"           # Cyan
export COLOR_07="#ff79c6"           # Magenta
export COLOR_08="#94A3A5"           # Light gray

export COLOR_09="#000000"           # Dark gray
export COLOR_10="#ff5555"           # Light Red
export COLOR_11="#50fa7b"           # Light Green
export COLOR_12="#ffb86c"           # Light Yellow
export COLOR_13="#8be9fd"           # Light Blue
export COLOR_14="#bd93f9"           # Light Cyan
export COLOR_15="#ff79c6"           # Light Magenta
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#282a36"   # Background Color
export FOREGROUND_COLOR="#94A3A5"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="_base"
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
