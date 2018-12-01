#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#878787"           # HOST
export COLOR_02="#ff6600"           # SYNTAX_STRING
export COLOR_03="#ccff04"           # COMMAND
export COLOR_04="#ffcc00"           # COMMAND_COLOR2
export COLOR_05="#44b4cc"           # PATH
export COLOR_06="#9933cc"           # SYNTAX_VAR
export COLOR_07="#44b4cc"           # PROMP
export COLOR_08="#f5f5f5"           #

export COLOR_09="#555555"           #
export COLOR_10="#ff0000"           # COMMAND_ERROR
export COLOR_11="#00ff00"           # EXEC
export COLOR_12="#ffff00"           #
export COLOR_13="#0000ff"           # FOLDER
export COLOR_14="#ff00ff"           #
export COLOR_15="#00ffff"           #
export COLOR_16="#e5e5e5"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Vibrant Ink"
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
