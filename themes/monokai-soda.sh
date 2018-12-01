#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1a1a1a"           # HOST
export COLOR_02="#f4005f"           # SYNTAX_STRING
export COLOR_03="#98e024"           # COMMAND
export COLOR_04="#fa8419"           # COMMAND_COLOR2
export COLOR_05="#9d65ff"           # PATH
export COLOR_06="#f4005f"           # SYNTAX_VAR
export COLOR_07="#58d1eb"           # PROMP
export COLOR_08="#c4c5b5"           #

export COLOR_09="#625e4c"           #
export COLOR_10="#f4005f"           # COMMAND_ERROR
export COLOR_11="#98e024"           # EXEC
export COLOR_12="#e0d561"           #
export COLOR_13="#9d65ff"           # FOLDER
export COLOR_14="#f4005f"           #
export COLOR_15="#58d1eb"           #
export COLOR_16="#f6f6ef"           #

export BACKGROUND_COLOR="#1a1a1a"   # Background Color
export FOREGROUND_COLOR="#c4c5b5"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Monokai Soda"
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
