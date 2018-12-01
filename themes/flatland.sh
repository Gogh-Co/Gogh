#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1d1d19"           # HOST
export COLOR_02="#f18339"           # SYNTAX_STRING
export COLOR_03="#9fd364"           # COMMAND
export COLOR_04="#f4ef6d"           # COMMAND_COLOR2
export COLOR_05="#5096be"           # PATH
export COLOR_06="#695abc"           # SYNTAX_VAR
export COLOR_07="#d63865"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#1d1d19"           #
export COLOR_10="#d22a24"           # COMMAND_ERROR
export COLOR_11="#a7d42c"           # EXEC
export COLOR_12="#ff8949"           #
export COLOR_13="#61b9d0"           # FOLDER
export COLOR_14="#695abc"           #
export COLOR_15="#d63865"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#1d1f21"   # Background Color
export FOREGROUND_COLOR="#b8dbef"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Flatland"
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
