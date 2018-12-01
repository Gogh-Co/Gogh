#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1f1f1f"           # HOST
export COLOR_02="#fb002a"           # SYNTAX_STRING
export COLOR_03="#339c24"           # COMMAND
export COLOR_04="#659b25"           # COMMAND_COLOR2
export COLOR_05="#149b45"           # PATH
export COLOR_06="#53b82c"           # SYNTAX_VAR
export COLOR_07="#2cb868"           # PROMP
export COLOR_08="#e0ffef"           #

export COLOR_09="#032710"           #
export COLOR_10="#a7ff3f"           # COMMAND_ERROR
export COLOR_11="#9fff6d"           # EXEC
export COLOR_12="#d2ff6d"           #
export COLOR_13="#72ffb5"           # FOLDER
export COLOR_14="#50ff3e"           #
export COLOR_15="#22ff71"           #
export COLOR_16="#daefd0"           #

export BACKGROUND_COLOR="#3a3d3f"   # Background Color
export FOREGROUND_COLOR="#d9efd3"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="IC Green PPL"
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
