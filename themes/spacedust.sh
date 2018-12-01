#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#6e5346"           # HOST
export COLOR_02="#e35b00"           # SYNTAX_STRING
export COLOR_03="#5cab96"           # COMMAND
export COLOR_04="#e3cd7b"           # COMMAND_COLOR2
export COLOR_05="#0f548b"           # PATH
export COLOR_06="#e35b00"           # SYNTAX_VAR
export COLOR_07="#06afc7"           # PROMP
export COLOR_08="#f0f1ce"           #

export COLOR_09="#684c31"           #
export COLOR_10="#ff8a3a"           # COMMAND_ERROR
export COLOR_11="#aecab8"           # EXEC
export COLOR_12="#ffc878"           #
export COLOR_13="#67a0ce"           # FOLDER
export COLOR_14="#ff8a3a"           #
export COLOR_15="#83a7b4"           #
export COLOR_16="#fefff1"           #

export BACKGROUND_COLOR="#0a1e24"   # Background Color
export FOREGROUND_COLOR="#ecf0c1"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Spacedust"
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
