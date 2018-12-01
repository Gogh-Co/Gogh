#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#cc0000"           # SYNTAX_STRING
export COLOR_03="#1a921c"           # COMMAND
export COLOR_04="#f0e53a"           # COMMAND_COLOR2
export COLOR_05="#0066ff"           # PATH
export COLOR_06="#c5656b"           # SYNTAX_VAR
export COLOR_07="#06989a"           # PROMP
export COLOR_08="#d3d7cf"           #

export COLOR_09="#555753"           #
export COLOR_10="#ef2929"           # COMMAND_ERROR
export COLOR_11="#9aff87"           # EXEC
export COLOR_12="#fffb5c"           #
export COLOR_13="#43a8ed"           # FOLDER
export COLOR_14="#ff818a"           #
export COLOR_15="#34e2e2"           #
export COLOR_16="#eeeeec"           #

export BACKGROUND_COLOR="#2a211c"   # Background Color
export FOREGROUND_COLOR="#b8a898"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Espresso Libre"
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
