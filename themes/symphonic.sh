#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#dc322f"           # SYNTAX_STRING
export COLOR_03="#56db3a"           # COMMAND
export COLOR_04="#ff8400"           # COMMAND_COLOR2
export COLOR_05="#0084d4"           # PATH
export COLOR_06="#b729d9"           # SYNTAX_VAR
export COLOR_07="#ccccff"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#1b1d21"           #
export COLOR_10="#dc322f"           # COMMAND_ERROR
export COLOR_11="#56db3a"           # EXEC
export COLOR_12="#ff8400"           #
export COLOR_13="#0084d4"           # FOLDER
export COLOR_14="#b729d9"           #
export COLOR_15="#ccccff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Symphonic"
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
