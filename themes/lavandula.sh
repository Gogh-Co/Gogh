#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#230046"           # HOST
export COLOR_02="#7d1625"           # SYNTAX_STRING
export COLOR_03="#337e6f"           # COMMAND
export COLOR_04="#7f6f49"           # COMMAND_COLOR2
export COLOR_05="#4f4a7f"           # PATH
export COLOR_06="#5a3f7f"           # SYNTAX_VAR
export COLOR_07="#58777f"           # PROMP
export COLOR_08="#736e7d"           #

export COLOR_09="#372d46"           #
export COLOR_10="#e05167"           # COMMAND_ERROR
export COLOR_11="#52e0c4"           # EXEC
export COLOR_12="#e0c386"           #
export COLOR_13="#8e87e0"           # FOLDER
export COLOR_14="#a776e0"           #
export COLOR_15="#9ad4e0"           #
export COLOR_16="#8c91fa"           #

export BACKGROUND_COLOR="#050014"   # Background Color
export FOREGROUND_COLOR="#736e7d"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Lavandula"
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
