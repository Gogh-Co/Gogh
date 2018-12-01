#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="##243342"           # Black
export COLOR_02="##C54133"           # Red
export COLOR_03="##27AE60"           # Green
export COLOR_04="##EDB20A"           # Yellow
export COLOR_05="##2479D0"           # Blue
export COLOR_06="##7D3EA0"           # Magenta
export COLOR_07="##1D8579"           # Cyan
export COLOR_08="##C9CCCD"           # Light gray

export COLOR_09="##34495E"           # Dark gray
export COLOR_10="##E74C3C"           # Light Red
export COLOR_11="##2ECC71"           # Light Green
export COLOR_12="##F1C40F"           # Light Yellow
export COLOR_13="##3498DB"           # Light Blue
export COLOR_14="##9B59B6"           # Light Magenta
export COLOR_15="##2AA198"           # Light Cyan
export COLOR_16="##ECF0F1"           # White

export BACKGROUND_COLOR="#260346"   # Background Color
export FOREGROUND_COLOR="#DADADA"   # Foreground Color (text)
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
