#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ca274d"           # SYNTAX_STRING
export COLOR_03="#4dca27"           # COMMAND
export COLOR_04="#caa427"           # COMMAND_COLOR2
export COLOR_05="#274dca"           # PATH
export COLOR_06="#a427ca"           # SYNTAX_VAR
export COLOR_07="#27caa4"           # PROMP
export COLOR_08="#808080"           #

export COLOR_09="#808080"           #
export COLOR_10="#e98da3"           # COMMAND_ERROR
export COLOR_11="#a3e98d"           # EXEC
export COLOR_12="#e9d48d"           #
export COLOR_13="#8da3e9"           # FOLDER
export COLOR_14="#d48de9"           #
export COLOR_15="#8de9d4"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#09111a"   # Background Color
export FOREGROUND_COLOR="#d9e6f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Cai"
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
