#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#e24346"           # SYNTAX_STRING
export COLOR_03="#39b13a"           # COMMAND
export COLOR_04="#dae145"           # COMMAND_COLOR2
export COLOR_05="#4261c5"           # PATH
export COLOR_06="#f920fb"           # SYNTAX_VAR
export COLOR_07="#2abbd4"           # PROMP
export COLOR_08="#d0b8a3"           #

export COLOR_09="#fefcfc"           #
export COLOR_10="#e97071"           # COMMAND_ERROR
export COLOR_11="#9cc090"           # EXEC
export COLOR_12="#ddda7a"           #
export COLOR_13="#7b91d6"           # FOLDER
export COLOR_14="#f674ba"           #
export COLOR_15="#5ed1e5"           #
export COLOR_16="#d8c8bb"           #

export BACKGROUND_COLOR="#404040"   # Background Color
export FOREGROUND_COLOR="#afdab6"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Warm Neon"
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
