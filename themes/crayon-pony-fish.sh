#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2b1b1d"           # HOST
export COLOR_02="#91002b"           # SYNTAX_STRING
export COLOR_03="#579524"           # COMMAND
export COLOR_04="#ab311b"           # COMMAND_COLOR2
export COLOR_05="#8c87b0"           # PATH
export COLOR_06="#692f50"           # SYNTAX_VAR
export COLOR_07="#e8a866"           # PROMP
export COLOR_08="#68525a"           #

export COLOR_09="#3d2b2e"           #
export COLOR_10="#c5255d"           # COMMAND_ERROR
export COLOR_11="#8dff57"           # EXEC
export COLOR_12="#c8381d"           #
export COLOR_13="#cfc9ff"           # FOLDER
export COLOR_14="#fc6cba"           #
export COLOR_15="#ffceaf"           #
export COLOR_16="#b0949d"           #

export BACKGROUND_COLOR="#150707"   # Background Color
export FOREGROUND_COLOR="#68525a"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Crayon Pony Fish"
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
