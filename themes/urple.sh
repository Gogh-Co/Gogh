#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#b0425b"           # SYNTAX_STRING
export COLOR_03="#37a415"           # COMMAND
export COLOR_04="#ad5c42"           # COMMAND_COLOR2
export COLOR_05="#564d9b"           # PATH
export COLOR_06="#6c3ca1"           # SYNTAX_VAR
export COLOR_07="#808080"           # PROMP
export COLOR_08="#87799c"           #

export COLOR_09="#5d3225"           #
export COLOR_10="#ff6388"           # COMMAND_ERROR
export COLOR_11="#29e620"           # EXEC
export COLOR_12="#f08161"           #
export COLOR_13="#867aed"           # FOLDER
export COLOR_14="#a05eee"           #
export COLOR_15="#eaeaea"           #
export COLOR_16="#bfa3ff"           #

export BACKGROUND_COLOR="#1b1b23"   # Background Color
export FOREGROUND_COLOR="#877a9b"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Urple"
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
