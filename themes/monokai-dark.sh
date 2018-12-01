#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#75715e"           # HOST
export COLOR_02="#f92672"           # SYNTAX_STRING
export COLOR_03="#a6e22e"           # COMMAND
export COLOR_04="#f4bf75"           # COMMAND_COLOR2
export COLOR_05="#66d9ef"           # PATH
export COLOR_06="#ae81ff"           # SYNTAX_VAR
export COLOR_07="#2AA198"           # PROMP
export COLOR_08="#f9f8f5"           #

export COLOR_09="#272822"           #
export COLOR_10="#f92672"           # COMMAND_ERROR
export COLOR_11="#a6e22e"           # EXEC
export COLOR_12="#f4bf75"           #
export COLOR_13="#66d9ef"           # FOLDER
export COLOR_14="#ae81ff"           #
export COLOR_15="#2AA198"           #
export COLOR_16="#f8f8f2"           #

export BACKGROUND_COLOR="#272822"   # Background Color
export FOREGROUND_COLOR="#f8f8f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Monokai Dark"
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
