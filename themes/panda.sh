#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1F1F20"           # Black
export COLOR_02="#FB055A"           # Red
export COLOR_03="#26FFD4"           # Green
export COLOR_04="#FDAA5A"           # Yellow
export COLOR_05="#5C9FFF"           # Blue
export COLOR_06="#FC59A6"           # Magenta
export COLOR_07="#26FFD4"           # Cyan
export COLOR_08="#F0F0F0"           # Light gray

export COLOR_09="#5C6370"           # Dark gray
export COLOR_10="#FB055A"           # Light Red
export COLOR_11="#26FFD4"           # Light Green
export COLOR_12="#FEBE7E"           # Light Yellow
export COLOR_13="#55ADFF"           # Light Blue
export COLOR_14="#FD95D0"           # Light Magenta
export COLOR_15="#26FFD4"           # Light Cyan
export COLOR_16="#F0F0F0"           # White

export BACKGROUND_COLOR="#1D1E20"   # Background Color
export FOREGROUND_COLOR="#F0F0F0"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Panda"
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
