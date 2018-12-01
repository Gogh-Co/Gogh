#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#232323"           # HOST
export COLOR_02="#ff000f"           # SYNTAX_STRING
export COLOR_03="#8ce10b"           # COMMAND
export COLOR_04="#ffb900"           # COMMAND_COLOR2
export COLOR_05="#008df8"           # PATH
export COLOR_06="#6d43a6"           # SYNTAX_VAR
export COLOR_07="#00d8eb"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#444444"           #
export COLOR_10="#ff2740"           # COMMAND_ERROR
export COLOR_11="#abe15b"           # EXEC
export COLOR_12="#ffd242"           #
export COLOR_13="#0092ff"           # FOLDER
export COLOR_14="#9a5feb"           #
export COLOR_15="#67fff0"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#0e1019"   # Background Color
export FOREGROUND_COLOR="#fffaf4"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Argonaut"
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
