#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#d5d6dd"           # Black
export COLOR_02="#d52753"           # Red
export COLOR_03="#23974a"           # Green
export COLOR_04="#df631c"           # Yellow
export COLOR_05="#275fe4"           # Blue
export COLOR_06="#823ff1"           # Magenta
export COLOR_07="#27618d"           # Cyan
export COLOR_08="#000000"           # Light gray

export COLOR_09="#e4e5ed"           # Dark gray
export COLOR_10="#ff6480"           # Light Red
export COLOR_11="#3cbc66"           # Light Green
export COLOR_12="#c5a332"           # Light Yellow
export COLOR_13="#0099e1"           # Light Blue
export COLOR_14="#ce33c0"           # Light Magenta
export COLOR_15="#6d93bb"           # Light Cyan
export COLOR_16="#26272d"           # White

export BACKGROUND_COLOR="#f9f9f9"   # Background Color
export FOREGROUND_COLOR="#383a42"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Bluloco Light"
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
