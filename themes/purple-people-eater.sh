#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#0d1117"           # Black
export COLOR_02="#e34c26"           # Red
export COLOR_03="#238636"           # Green
export COLOR_04="#ed9a51"           # Yellow
export COLOR_05="#a5d6ff"           # Blue
export COLOR_06="#6eb0e8"           # Magenta
export COLOR_07="#c09aeb"           # Cyan
export COLOR_08="#c9d1d9"           # Light gray

export COLOR_09="#0d1117"           # Dark gray
export COLOR_10="#ff7b72"           # Light Red
export COLOR_11="#3bab4a"           # Light Green
export COLOR_12="#ffa657"           # Light Yellow
export COLOR_13="#a5d6ff"           # Light Blue
export COLOR_14="#79c0ff"           # Light Magenta
export COLOR_15="#b694df"           # Light Cyan
export COLOR_16="#c9d1d9"           # White

export BACKGROUND_COLOR="#161b22"   # Background Color
export FOREGROUND_COLOR="#c9d1d9"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Purple People Eater"
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
