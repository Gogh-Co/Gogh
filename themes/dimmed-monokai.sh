#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3a3d43"           # HOST
export COLOR_02="#be3f48"           # SYNTAX_STRING
export COLOR_03="#879a3b"           # COMMAND
export COLOR_04="#c5a635"           # COMMAND_COLOR2
export COLOR_05="#4f76a1"           # PATH
export COLOR_06="#855c8d"           # SYNTAX_VAR
export COLOR_07="#578fa4"           # PROMP
export COLOR_08="#b9bcba"           #

export COLOR_09="#888987"           #
export COLOR_10="#fb001f"           # COMMAND_ERROR
export COLOR_11="#0f722f"           # EXEC
export COLOR_12="#c47033"           #
export COLOR_13="#186de3"           # FOLDER
export COLOR_14="#fb0067"           #
export COLOR_15="#2e706d"           #
export COLOR_16="#fdffb9"           #

export BACKGROUND_COLOR="#1f1f1f"   # Background Color
export FOREGROUND_COLOR="#b9bcba"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Dimmed Monokai"
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
