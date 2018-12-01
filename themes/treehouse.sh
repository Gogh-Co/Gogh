#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#321300"           # HOST
export COLOR_02="#b2270e"           # SYNTAX_STRING
export COLOR_03="#44a900"           # COMMAND
export COLOR_04="#aa820c"           # COMMAND_COLOR2
export COLOR_05="#58859a"           # PATH
export COLOR_06="#97363d"           # SYNTAX_VAR
export COLOR_07="#b25a1e"           # PROMP
export COLOR_08="#786b53"           #

export COLOR_09="#433626"           #
export COLOR_10="#ed5d20"           # COMMAND_ERROR
export COLOR_11="#55f238"           # EXEC
export COLOR_12="#f2b732"           #
export COLOR_13="#85cfed"           # FOLDER
export COLOR_14="#e14c5a"           #
export COLOR_15="#f07d14"           #
export COLOR_16="#ffc800"           #

export BACKGROUND_COLOR="#191919"   # Background Color
export FOREGROUND_COLOR="#786b53"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Treehouse"
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
