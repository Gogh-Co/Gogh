#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1b1d1e"           # HOST
export COLOR_02="#f92672"           # SYNTAX_STRING
export COLOR_03="#a6e22e"           # COMMAND
export COLOR_04="#fd971f"           # COMMAND_COLOR2
export COLOR_05="#66d9ef"           # PATH
export COLOR_06="#9e6ffe"           # SYNTAX_VAR
export COLOR_07="#5e7175"           # PROMP
export COLOR_08="#ccccc6"           #

export COLOR_09="#505354"           #
export COLOR_10="#ff669d"           # COMMAND_ERROR
export COLOR_11="#beed5f"           # EXEC
export COLOR_12="#e6db74"           #
export COLOR_13="#66d9ef"           # FOLDER
export COLOR_14="#9e6ffe"           #
export COLOR_15="#a3babf"           #
export COLOR_16="#f8f8f2"           #

export BACKGROUND_COLOR="#121212"   # Background Color
export FOREGROUND_COLOR="#a0a0a0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Hardcore"
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
