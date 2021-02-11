#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3F3F54"           # Black
export COLOR_02="#f60055"           # Red
export COLOR_03="#06c993"           # Green
export COLOR_04="#9700be"           # Yellow
export COLOR_05="#f69154"           # Blue
export COLOR_06="#ec89cb"           # Magenta
export COLOR_07="#60ADEC"           # Cyan
export COLOR_08="#ABB2BF"           # Light gray

export COLOR_09="#959DCB"           # Dark gray
export COLOR_10="#f60055"           # Light Red
export COLOR_11="#06c993"           # Light Green
export COLOR_12="#9700be"           # Light Yellow
export COLOR_13="#f69154"           # Light Blue
export COLOR_14="#ec89cb"           # Light Magenta
export COLOR_15="#00dded"           # Light Cyan
export COLOR_16="#ffffff"           # White

export BACKGROUND_COLOR="#222235"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Sweet Terminal"
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
