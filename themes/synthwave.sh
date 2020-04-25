#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#011627"           # Black
export COLOR_02="#fe4450"           # Red
export COLOR_03="#72f1b8"           # Green
export COLOR_04="#fede5d"           # Yellow
export COLOR_05="#03edf9"           # Blue
export COLOR_06="#ff7edb"           # Magenta
export COLOR_07="#03edf9"           # Cyan
export COLOR_08="#ffffff"           # Light gray

export COLOR_09="#575656"           # Dark gray
export COLOR_10="#fe4450"           # Light Red
export COLOR_11="#72f1b8"           # Light Green
export COLOR_12="#fede5d"           # Light Yellow
export COLOR_13="#03edf9"           # Light Blue
export COLOR_14="#ff7edb"           # Light Magenta
export COLOR_15="#03edf9"           # Light Cyan
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#262335"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Foreground Color (text)
export CURSOR_COLOR="#03edf9" # Cursor color
export PROFILE_NAME="SynthWave"
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
