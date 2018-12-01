#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282a2e"           # HOST
export COLOR_02="#a54242"           # SYNTAX_STRING
export COLOR_03="#a1b56c"           # COMMAND
export COLOR_04="#de935f"           # COMMAND_COLOR2
export COLOR_05="#225555"           # PATH
export COLOR_06="#85678f"           # SYNTAX_VAR
export COLOR_07="#5e8d87"           # PROMP
export COLOR_08="#777777"           #

export COLOR_09="#373b41"           #
export COLOR_10="#c63535"           # COMMAND_ERROR
export COLOR_11="#608360"           # EXEC
export COLOR_12="#fa805a"           #
export COLOR_13="#449da1"           # FOLDER
export COLOR_14="#ba8baf"           #
export COLOR_15="#86c1b9"           #
export COLOR_16="#c5c8c6"           #

export BACKGROUND_COLOR="#091116"   # Background Color
export FOREGROUND_COLOR="#868A8C"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Terminix Dark"
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
