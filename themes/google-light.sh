#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#202124"           # Black
export COLOR_02="#EA4335"           # Red
export COLOR_03="#34A853"           # Green
export COLOR_04="#FBBC04"           # Yellow
export COLOR_05="#4285F4"           # Blue
export COLOR_06="#A142F4"           # Cyan
export COLOR_07="#24C1E0"           # Purple
export COLOR_08="#E8EAED"           # Light gray

export COLOR_09="#5F6368"           # Dark gray
export COLOR_10="#EA4335"           # Bright Red
export COLOR_11="#34A853"           # Bright Green
export COLOR_12="#FBBC05"           # Bright Yellow
export COLOR_13="#4285F4"           # Bright Blue
export COLOR_14="#A142F4"           # Bright Cyan
export COLOR_15="#24C1E0"           # Bright Purple
export COLOR_16="#FFFFFF"           # White

export BACKGROUND_COLOR="#FFFFFF"   # Background Color
export FOREGROUND_COLOR="#5F6368"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Google Light"
# =============================================







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
