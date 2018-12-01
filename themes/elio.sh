#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#303030"           # HOST
export COLOR_02="#e1321a"           # SYNTAX_STRING
export COLOR_03="#6ab017"           # COMMAND
export COLOR_04="#ffc005"           # COMMAND_COLOR2
export COLOR_05="#729FCF"           # PATH
export COLOR_06="#ec0048"           # SYNTAX_VAR
export COLOR_07="#2aa7e7"           # PROMP
export COLOR_08="#f2f2f2"           #

export COLOR_09="#5d5d5d"           #
export COLOR_10="#ff361e"           # COMMAND_ERROR
export COLOR_11="#7bc91f"           # EXEC
export COLOR_12="#ffd00a"           #
export COLOR_13="#0071ff"           # FOLDER
export COLOR_14="#ff1d62"           #
export COLOR_15="#4bb8fd"           #
export COLOR_16="#a020f0"           #

export BACKGROUND_COLOR="#041A3B"   # Background Color
export FOREGROUND_COLOR="#f2f2f2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Elio"
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
