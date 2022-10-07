#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1e2229"           # HOST
export COLOR_02="#ed1515"           # SYNTAX_STRING
export COLOR_03="#44853a"           # COMMAND
export COLOR_04="#f67400"           # COMMAND_COLOR2
export COLOR_05="#1d99f3"           # PATH
export COLOR_06="#9b59b6"           # SYNTAX_VAR
export COLOR_07="#1abc9c"           # PROMP
export COLOR_08="#fcfcfc"           # 

export COLOR_09="#7f8c8d"           # 
export COLOR_10="#c0392b"           # COMMAND_ERROR
export COLOR_11="#55a649"           # EXEC
export COLOR_12="#fdbc4b"           # 
export COLOR_13="#3daee9"           # FOLDER
export COLOR_14="#8e44ad"           # 
export COLOR_15="#16a085"           # 
export COLOR_16="#ffffff"           # 

export BACKGROUND_COLOR="#1e2229"   # Background Color
export FOREGROUND_COLOR="#bbbbbb"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Breath Silverfox"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


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
