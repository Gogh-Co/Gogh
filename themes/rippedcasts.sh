#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#cdaf95"           # SYNTAX_STRING
export COLOR_03="#a8ff60"           # COMMAND
export COLOR_04="#bfbb1f"           # COMMAND_COLOR2
export COLOR_05="#75a5b0"           # PATH
export COLOR_06="#ff73fd"           # SYNTAX_VAR
export COLOR_07="#5a647e"           # PROMP
export COLOR_08="#bfbfbf"           #

export COLOR_09="#666666"           #
export COLOR_10="#eecbad"           # COMMAND_ERROR
export COLOR_11="#bcee68"           # EXEC
export COLOR_12="#e5e500"           #
export COLOR_13="#86bdc9"           # FOLDER
export COLOR_14="#e500e5"           #
export COLOR_15="#8c9bc4"           #
export COLOR_16="#e5e5e5"           #

export BACKGROUND_COLOR="#2b2b2b"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Rippedcasts"
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
