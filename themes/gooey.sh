#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000009"           # Black
export COLOR_02="#BB4F6C"           # Red
export COLOR_03="#72CCAE"           # Green
export COLOR_04="#C65E3D"           # Yellow
export COLOR_05="#58B6CA"           # Blue
export COLOR_06="#6488C4"           # Cyan
export COLOR_07="#8D84C6"           # Magenta
export COLOR_08="#858893"           # Light gray

export COLOR_09="#1f222d"           # Dark gray
export COLOR_10="#ee829f"           # Light Red
export COLOR_11="#a5ffe1"           # Light Green
export COLOR_12="#f99170"           # Light Yellow
export COLOR_13="#8be9fd"           # Light Blue
export COLOR_14="#97bbf7"           # Light Cyan
export COLOR_15="#c0b7f9"           # Light Magenta
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#0D101B"   # Background Color
export FOREGROUND_COLOR="#EBEEF9"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="gooey"
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
