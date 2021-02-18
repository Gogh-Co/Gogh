#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#303030"           # Black
export COLOR_02="#EB64B9"           # Red
export COLOR_03="#74DFC4"           # Green
export COLOR_04="#FEAE87"           # Yellow
export COLOR_05="#40B4C4"           # Blue
export COLOR_06="#B381C5"           # Magenta
export COLOR_07="#06989A"           # Cyan
export COLOR_08="#D1D1D1"           # Light gray

export COLOR_09="#91889B"           # Dark gray
export COLOR_10="#FC2377"           # Light Red
export COLOR_11="#50FA7B"           # Light Green
export COLOR_12="#FFE261"           # Light Yellow
export COLOR_13="#40B4C4"           # Light Blue
export COLOR_14="#6D75E0"           # Light Magenta
export COLOR_15="#B4DCE7"           # Light Cyan
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#1F1926"   # Background Color
export FOREGROUND_COLOR="#C7E1E4"   # Foreground Color (text)
export CURSOR_COLOR="#C7C7C7"       # Cursor color
export PROFILE_NAME="laserwave"
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
