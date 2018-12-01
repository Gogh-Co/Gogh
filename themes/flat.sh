#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2c3e50"           # HOST
export COLOR_02="#c0392b"           # SYNTAX_STRING
export COLOR_03="#27ae60"           # COMMAND
export COLOR_04="#f39c12"           # COMMAND_COLOR2
export COLOR_05="#2980b9"           # PATH
export COLOR_06="#8e44ad"           # SYNTAX_VAR
export COLOR_07="#16a085"           # PROMP
export COLOR_08="#bdc3c7"           #

export COLOR_09="#34495e"           #
export COLOR_10="#e74c3c"           # COMMAND_ERROR
export COLOR_11="#2ecc71"           # EXEC
export COLOR_12="#f1c40f"           #
export COLOR_13="#3498db"           # FOLDER
export COLOR_14="#9b59b6"           #
export COLOR_15="#2AA198"           #
export COLOR_16="#ecf0f1"           #

export BACKGROUND_COLOR="#1F2D3A"   # Background Color
export FOREGROUND_COLOR="#1abc9c"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Flat"
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
