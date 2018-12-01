#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#002831"           # HOST
export COLOR_02="#d11c24"           # SYNTAX_STRING
export COLOR_03="#6cbe6c"           # COMMAND
export COLOR_04="#a57706"           # COMMAND_COLOR2
export COLOR_05="#2176c7"           # PATH
export COLOR_06="#c61c6f"           # SYNTAX_VAR
export COLOR_07="#259286"           # PROMP
export COLOR_08="#eae3cb"           #

export COLOR_09="#006488"           #
export COLOR_10="#f5163b"           # COMMAND_ERROR
export COLOR_11="#51ef84"           # EXEC
export COLOR_12="#b27e28"           #
export COLOR_13="#178ec8"           # FOLDER
export COLOR_14="#e24d8e"           #
export COLOR_15="#00b39e"           #
export COLOR_16="#fcf4dc"           #

export BACKGROUND_COLOR="#001e27"   # Background Color
export FOREGROUND_COLOR="#9cc2c3"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Solarized Dark Higher Contrast"
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
