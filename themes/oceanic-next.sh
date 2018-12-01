#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#121C21"           # HOST
export COLOR_02="#E44754"           # SYNTAX_STRING
export COLOR_03="#89BD82"           # COMMAND
export COLOR_04="#F7BD51"           # COMMAND_COLOR2
export COLOR_05="#5486C0"           # PATH
export COLOR_06="#B77EB8"           # SYNTAX_VAR
export COLOR_07="#50A5A4"           # PROMP
export COLOR_08="#FFFFFF"           #

export COLOR_09="#52606B"           #
export COLOR_10="#E44754"           # COMMAND_ERROR
export COLOR_11="#89BD82"           # EXEC
export COLOR_12="#F7BD51"           #
export COLOR_13="#5486C0"           # FOLDER
export COLOR_14="#B77EB8"           #
export COLOR_15="#50A5A4"           #
export COLOR_16="#FFFFFF"           #

export BACKGROUND_COLOR="#121b21"   # Background Color
export FOREGROUND_COLOR="#b3b8c3"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Oceanic Next"
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
