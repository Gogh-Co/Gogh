#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#c37372"           # SYNTAX_STRING
export COLOR_03="#72c373"           # COMMAND
export COLOR_04="#c2c372"           # COMMAND_COLOR2
export COLOR_05="#7372c3"           # PATH
export COLOR_06="#c372c2"           # SYNTAX_VAR
export COLOR_07="#72c2c3"           # PROMP
export COLOR_08="#d9d9d9"           #

export COLOR_09="#323232"           #
export COLOR_10="#dbaaaa"           # COMMAND_ERROR
export COLOR_11="#aadbaa"           # EXEC
export COLOR_12="#dadbaa"           #
export COLOR_13="#aaaadb"           # FOLDER
export COLOR_14="#dbaada"           #
export COLOR_15="#aadadb"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#29262f"   # Background Color
export FOREGROUND_COLOR="#d9e6f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Chalkboard"
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
