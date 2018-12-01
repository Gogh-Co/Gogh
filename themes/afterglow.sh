#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#151515"           # HOST
export COLOR_02="#a53c23"           # SYNTAX_STRING
export COLOR_03="#7b9246"           # COMMAND
export COLOR_04="#d3a04d"           # COMMAND_COLOR2
export COLOR_05="#6c99bb"           # PATH
export COLOR_06="#9f4e85"           # SYNTAX_VAR
export COLOR_07="#7dd6cf"           # PROMP
export COLOR_08="#d0d0d0"           #

export COLOR_09="#505050"           #
export COLOR_10="#a53c23"           # COMMAND_ERROR
export COLOR_11="#7b9246"           # EXEC
export COLOR_12="#d3a04d"           #
export COLOR_13="#547c99"           # FOLDER
export COLOR_14="#9f4e85"           #
export COLOR_15="#7dd6cf"           #
export COLOR_16="#f5f5f5"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#d0d0d0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Afterglow"
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
