#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#20111b"           # HOST
export COLOR_02="#be100e"           # SYNTAX_STRING
export COLOR_03="#858162"           # COMMAND
export COLOR_04="#eaa549"           # COMMAND_COLOR2
export COLOR_05="#426a79"           # PATH
export COLOR_06="#97522c"           # SYNTAX_VAR
export COLOR_07="#989a9c"           # PROMP
export COLOR_08="#968c83"           #

export COLOR_09="#5e5252"           #
export COLOR_10="#be100e"           # COMMAND_ERROR
export COLOR_11="#858162"           # EXEC
export COLOR_12="#eaa549"           #
export COLOR_13="#426a79"           # FOLDER
export COLOR_14="#97522c"           #
export COLOR_15="#989a9c"           #
export COLOR_16="#d5ccba"           #

export BACKGROUND_COLOR="#d5ccba"   # Background Color
export FOREGROUND_COLOR="#45373c"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Belafonte Day"
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
