#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2c3f58"           # HOST
export COLOR_02="#be2d26"           # SYNTAX_STRING
export COLOR_03="#1a9172"           # COMMAND
export COLOR_04="#db8e27"           # COMMAND_COLOR2
export COLOR_05="#325d96"           # PATH
export COLOR_06="#8a5edc"           # SYNTAX_VAR
export COLOR_07="#35a08f"           # PROMP
export COLOR_08="#23d183"           #

export COLOR_09="#336889"           #
export COLOR_10="#dd5944"           # COMMAND_ERROR
export COLOR_11="#31d07b"           # EXEC
export COLOR_12="#e7d84b"           #
export COLOR_13="#34a6da"           # FOLDER
export COLOR_14="#ae6bdc"           #
export COLOR_15="#42c3ae"           #
export COLOR_16="#d5d5d5"           #

export BACKGROUND_COLOR="#24364b"   # Background Color
export FOREGROUND_COLOR="#31d07b"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Toy Chest"
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
