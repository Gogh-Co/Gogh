#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff615a"           # SYNTAX_STRING
export COLOR_03="#b1e969"           # COMMAND
export COLOR_04="#ebd99c"           # COMMAND_COLOR2
export COLOR_05="#5da9f6"           # PATH
export COLOR_06="#e86aff"           # SYNTAX_VAR
export COLOR_07="#82fff7"           # PROMP
export COLOR_08="#dedacf"           #

export COLOR_09="#313131"           #
export COLOR_10="#f58c80"           # COMMAND_ERROR
export COLOR_11="#ddf88f"           # EXEC
export COLOR_12="#eee5b2"           #
export COLOR_13="#a5c7ff"           # FOLDER
export COLOR_14="#ddaaff"           #
export COLOR_15="#b7fff9"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#171717"   # Background Color
export FOREGROUND_COLOR="#dedacf"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Wombat"
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
