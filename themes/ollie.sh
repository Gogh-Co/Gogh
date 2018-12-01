#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ac2e31"           # SYNTAX_STRING
export COLOR_03="#31ac61"           # COMMAND
export COLOR_04="#ac4300"           # COMMAND_COLOR2
export COLOR_05="#2d57ac"           # PATH
export COLOR_06="#b08528"           # SYNTAX_VAR
export COLOR_07="#1fa6ac"           # PROMP
export COLOR_08="#8a8eac"           #

export COLOR_09="#5b3725"           #
export COLOR_10="#ff3d48"           # COMMAND_ERROR
export COLOR_11="#3bff99"           # EXEC
export COLOR_12="#ff5e1e"           #
export COLOR_13="#4488ff"           # FOLDER
export COLOR_14="#ffc21d"           #
export COLOR_15="#1ffaff"           #
export COLOR_16="#5b6ea7"           #

export BACKGROUND_COLOR="#222125"   # Background Color
export FOREGROUND_COLOR="#8a8dae"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Ollie"
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
