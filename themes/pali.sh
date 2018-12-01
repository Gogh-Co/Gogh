#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#0a0a0a"           # HOST
export COLOR_02="#ab8f74"           # SYNTAX_STRING
export COLOR_03="#74ab8f"           # COMMAND
export COLOR_04="#8fab74"           # COMMAND_COLOR2
export COLOR_05="#8f74ab"           # PATH
export COLOR_06="#ab748f"           # SYNTAX_VAR
export COLOR_07="#748fab"           # PROMP
export COLOR_08="#F2F2F2"           #

export COLOR_09="#5D5D5D"           #
export COLOR_10="#FF1D62"           # COMMAND_ERROR
export COLOR_11="#9cc3af"           # EXEC
export COLOR_12="#FFD00A"           #
export COLOR_13="#af9cc3"           # FOLDER
export COLOR_14="#FF1D62"           #
export COLOR_15="#4BB8FD"           #
export COLOR_16="#A020F0"           #

export BACKGROUND_COLOR="#232E37"   # Background Color
export FOREGROUND_COLOR="#d9e6f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Pali"
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
