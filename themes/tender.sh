#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1d1d1d"           # Black
export COLOR_02="#c5152f"           # Red
export COLOR_03="#c9d05c"           # Green
export COLOR_04="#ffc24b"           # Yellow
export COLOR_05="#b3deef"           # Blue
export COLOR_06="#d3b987"           # Magenta
export COLOR_07="#73cef4"           # Cyan
export COLOR_08="#eeeeee"           # Light gray

export COLOR_09="#323232"           # Dark gray
export COLOR_10="#f43753"           # Light Red
export COLOR_11="#d9e066"           # Light Green
export COLOR_12="#facc72"           # Light Yellow
export COLOR_13="#c0eafb"           # Light Blue
export COLOR_14="#efd093"           # Light Magenta
export COLOR_15="#a1d6ec"           # Light Cyan
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#282828"   # Background Color
export FOREGROUND_COLOR="#EEEEEE"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Tender"
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
