#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#222222"           # HOST
export COLOR_02="#e2a8bf"           # SYNTAX_STRING
export COLOR_03="#81d778"           # COMMAND
export COLOR_04="#c4c9c0"           # COMMAND_COLOR2
export COLOR_05="#264b49"           # PATH
export COLOR_06="#a481d3"           # SYNTAX_VAR
export COLOR_07="#15ab9c"           # PROMP
export COLOR_08="#02c5e0"           #

export COLOR_09="#ffffff"           #
export COLOR_10="#ffcdd9"           # COMMAND_ERROR
export COLOR_11="#beffa8"           # EXEC
export COLOR_12="#d0ccca"           #
export COLOR_13="#7ab0d2"           # FOLDER
export COLOR_14="#c5a7d9"           #
export COLOR_15="#8cdfe0"           #
export COLOR_16="#e0e0e0"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#35b1d2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Slate"
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
