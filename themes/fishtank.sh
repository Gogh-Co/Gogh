#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#03073c"           # HOST
export COLOR_02="#c6004a"           # SYNTAX_STRING
export COLOR_03="#acf157"           # COMMAND
export COLOR_04="#fecd5e"           # COMMAND_COLOR2
export COLOR_05="#525fb8"           # PATH
export COLOR_06="#986f82"           # SYNTAX_VAR
export COLOR_07="#968763"           # PROMP
export COLOR_08="#ecf0fc"           #

export COLOR_09="#6c5b30"           #
export COLOR_10="#da4b8a"           # COMMAND_ERROR
export COLOR_11="#dbffa9"           # EXEC
export COLOR_12="#fee6a9"           #
export COLOR_13="#b2befa"           # FOLDER
export COLOR_14="#fda5cd"           #
export COLOR_15="#a5bd86"           #
export COLOR_16="#f6ffec"           #

export BACKGROUND_COLOR="#232537"   # Background Color
export FOREGROUND_COLOR="#ecf0fe"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Fishtank"
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
