#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#292D3E"           # Black
export COLOR_02="#F07178"           # Red
export COLOR_03="#C3E88D"           # Green
export COLOR_04="#FFCB6B"           # Yellow
export COLOR_05="#82AAFF"           # Blue
export COLOR_06="#C792EA"           # Magenta
export COLOR_07="#60ADEC"           # Cyan
export COLOR_08="#ABB2BF"           # Light gray

export COLOR_09="#959DCB"           # Dark gray
export COLOR_10="#F07178"           # Light Red
export COLOR_11="#C3E88D"           # Light Green
export COLOR_12="#FF5572"           # Light Yellow
export COLOR_13="#82AAFF"           # Light Blue
export COLOR_14="#FFCB6B"           # Light Magenta
export COLOR_15="#676E95"           # Light Cyan
export COLOR_16="#FFFEFE"           # White

export BACKGROUND_COLOR="#292D3E"   # Background Color
export FOREGROUND_COLOR="#BFC7D5"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="_bash"
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
