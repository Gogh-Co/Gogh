#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#363537"           # Black
export COLOR_02="#ff618e"           # Red
export COLOR_03="#6ed892"           # Green
export COLOR_04="#ffe572"           # Yellow
export COLOR_05="#ff935b"           # Blue
export COLOR_06="#938ae0"           # Magenta
export COLOR_07="#3bd4e4"           # Cyan
export COLOR_08="#f7f1fe"           # Light gray

export COLOR_09="#363537"           # Dark gray
export COLOR_10="#ff618e"           # Light Red
export COLOR_11="#6ed892"           # Light Green
export COLOR_12="#ffe572"           # Light Yellow
export COLOR_13="#ff935b"           # Light Blue
export COLOR_14="#938ae0"           # Light Magenta
export COLOR_15="#3bd4e4"           # Light Cyan
export COLOR_16="#f7f1fe"           # White

export BACKGROUND_COLOR="#363537"   # Background Color
export FOREGROUND_COLOR="#f7f1fe"   # Foreground Color (text)
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
