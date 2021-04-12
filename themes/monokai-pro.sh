#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#363537"           # Dark Gray
export COLOR_02="#FF6188"           # Monokai Pro Red
export COLOR_03="#A9DC76"           # Monokai Pro Green
export COLOR_04="#FFD866"           # Monokai Pro Yellow
export COLOR_05="#FC9867"           # Monokai Pro Orange
export COLOR_06="#AB9DF2"           # Monokai Pro Magenta
export COLOR_07="#78DCE8"           # Monokai Pro Cyan
export COLOR_08="#FDF9F3"           # Light Gray

export COLOR_09="#908E8F"           # Dark Gray
export COLOR_10="#FF6188"           # Monokai Pro Red
export COLOR_11="#A9DC76"           # Monokai Pro Green
export COLOR_12="#FFD866"           # Monokai Pro Yellow
export COLOR_13="#FC9867"           # Monokai Pro Orange
export COLOR_14="#AB9DF2"           # Monokai Pro Magenta
export COLOR_15="#78DCE8"           # Monokai Pro Cyan
export COLOR_16="#FDF9F3"           # Light Gray

export BACKGROUND_COLOR="#363537"   # Background Color
export FOREGROUND_COLOR="#FDF9F3"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Monokai Pro"
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
