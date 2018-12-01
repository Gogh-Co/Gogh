#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#112616"           # HOST
export COLOR_02="#7f2b27"           # SYNTAX_STRING
export COLOR_03="#2f7e25"           # COMMAND
export COLOR_04="#717f24"           # COMMAND_COLOR2
export COLOR_05="#2f6a7f"           # PATH
export COLOR_06="#47587f"           # SYNTAX_VAR
export COLOR_07="#327f77"           # PROMP
export COLOR_08="#647d75"           #

export COLOR_09="#3c4812"           #
export COLOR_10="#e08009"           # COMMAND_ERROR
export COLOR_11="#18e000"           # EXEC
export COLOR_12="#bde000"           #
export COLOR_13="#00aae0"           # FOLDER
export COLOR_14="#0058e0"           #
export COLOR_15="#00e0c4"           #
export COLOR_16="#73fa91"           #

export BACKGROUND_COLOR="#0f1610"   # Background Color
export FOREGROUND_COLOR="#637d75"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Alien Blood"
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
