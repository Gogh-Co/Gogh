#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff4d83"           # SYNTAX_STRING
export COLOR_03="#1f8c3b"           # COMMAND
export COLOR_04="#1fc95b"           # COMMAND_COLOR2
export COLOR_05="#1dd3ee"           # PATH
export COLOR_06="#8959a8"           # SYNTAX_VAR
export COLOR_07="#3e999f"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#000000"           #
export COLOR_10="#ff0021"           # COMMAND_ERROR
export COLOR_11="#1fc231"           # EXEC
export COLOR_12="#d5b807"           #
export COLOR_13="#15a9fd"           # FOLDER
export COLOR_14="#8959a8"           #
export COLOR_15="#3e999f"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#0a1e24"   # Background Color
export FOREGROUND_COLOR="#ecf0c1"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Spring"
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
