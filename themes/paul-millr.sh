#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2a2a2a"           # HOST
export COLOR_02="#ff0000"           # SYNTAX_STRING
export COLOR_03="#79ff0f"           # COMMAND
export COLOR_04="#d3bf00"           # COMMAND_COLOR2
export COLOR_05="#396bd7"           # PATH
export COLOR_06="#b449be"           # SYNTAX_VAR
export COLOR_07="#66ccff"           # PROMP
export COLOR_08="#bbbbbb"           #

export COLOR_09="#666666"           #
export COLOR_10="#ff0080"           # COMMAND_ERROR
export COLOR_11="#66ff66"           # EXEC
export COLOR_12="#f3d64e"           #
export COLOR_13="#709aed"           # FOLDER
export COLOR_14="#db67e6"           #
export COLOR_15="#7adff2"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#000000"   # Background Color
export FOREGROUND_COLOR="#f2f2f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Paul Millr"
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
