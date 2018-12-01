#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3e3e3e"           # HOST
export COLOR_02="#970b16"           # SYNTAX_STRING
export COLOR_03="#07962a"           # COMMAND
export COLOR_04="#f8eec7"           # COMMAND_COLOR2
export COLOR_05="#003e8a"           # PATH
export COLOR_06="#e94691"           # SYNTAX_VAR
export COLOR_07="#89d1ec"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#666666"           #
export COLOR_10="#de0000"           # COMMAND_ERROR
export COLOR_11="#87d5a2"           # EXEC
export COLOR_12="#f1d007"           #
export COLOR_13="#2e6cba"           # FOLDER
export COLOR_14="#ffa29f"           #
export COLOR_15="#1cfafe"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#f4f4f4"   # Background Color
export FOREGROUND_COLOR="#3e3e3e"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Github"
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
