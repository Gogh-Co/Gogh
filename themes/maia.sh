#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#232423"           # Black
export COLOR_02="#BA2922"           # Red
export COLOR_03="#7E807E"           # Green
export COLOR_04="#4C4F4D"           # Yellow
export COLOR_05="#16A085"           # Blue
export COLOR_06="#43746A"           # Magenta
export COLOR_07="#00CCCC"           # Cyan
export COLOR_08="#E0E0E0"           # Light gray

export COLOR_09="#282928"           # Dark gray
export COLOR_10="#CC372C"           # Light Red
export COLOR_11="#8D8F8D"           # Light Green
export COLOR_12="#4E524F"           # Light Yellow
export COLOR_13="#13BF9D"           # Light Blue
export COLOR_14="#487D72"           # Light Magenta
export COLOR_15="#00D1D1"           # Light Cyan
export COLOR_16="#E8E8E8"           # White

export BACKGROUND_COLOR="#31363B"   # Background Color
export FOREGROUND_COLOR="#BDC3C7"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Maia"
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
