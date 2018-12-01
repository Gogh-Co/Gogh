#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1b1d1e"           # HOST
export COLOR_02="#f92672"           # SYNTAX_STRING
export COLOR_03="#4df840"           # COMMAND
export COLOR_04="#f4fd22"           # COMMAND_COLOR2
export COLOR_05="#2757d6"           # PATH
export COLOR_06="#8c54fe"           # SYNTAX_VAR
export COLOR_07="#38c8b5"           # PROMP
export COLOR_08="#ccccc6"           #

export COLOR_09="#505354"           #
export COLOR_10="#ff5995"           # COMMAND_ERROR
export COLOR_11="#b6e354"           # EXEC
export COLOR_12="#feed6c"           #
export COLOR_13="#3f78ff"           # FOLDER
export COLOR_14="#9e6ffe"           #
export COLOR_15="#23cfd5"           #
export COLOR_16="#f8f8f2"           #

export BACKGROUND_COLOR="#1b1d1e"   # Background Color
export FOREGROUND_COLOR="#f8f8f8"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Thayer Bright"
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
