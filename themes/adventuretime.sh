#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#050404"           # HOST
export COLOR_02="#bd0013"           # SYNTAX_STRING
export COLOR_03="#4ab118"           # COMMAND
export COLOR_04="#e7741e"           # COMMAND_COLOR2
export COLOR_05="#0f4ac6"           # PATH
export COLOR_06="#665993"           # SYNTAX_VAR
export COLOR_07="#70a598"           # PROMP
export COLOR_08="#f8dcc0"           #

export COLOR_09="#4e7cbf"           #
export COLOR_10="#fc5f5a"           # COMMAND_ERROR
export COLOR_11="#9eff6e"           # EXEC
export COLOR_12="#efc11a"           #
export COLOR_13="#1997c6"           # FOLDER
export COLOR_14="#9b5953"           #
export COLOR_15="#c8faf4"           #
export COLOR_16="#f6f5fb"           #

export BACKGROUND_COLOR="#1f1d45"   # Background Color
export FOREGROUND_COLOR="#f8dcc0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Adventure Time"
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
