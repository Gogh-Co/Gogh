#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#010101"           # HOST
export COLOR_02="#f8b63f"           # SYNTAX_STRING
export COLOR_03="#7fb5e1"           # COMMAND
export COLOR_04="#d6da25"           # COMMAND_COLOR2
export COLOR_05="#489e48"           # PATH
export COLOR_06="#b296c6"           # SYNTAX_VAR
export COLOR_07="#f5bfd7"           # PROMP
export COLOR_08="#a8a49d"           #

export COLOR_09="#726e6a"           #
export COLOR_10="#f8b63f"           # COMMAND_ERROR
export COLOR_11="#7fb5e1"           # EXEC
export COLOR_12="#d6da25"           #
export COLOR_13="#489e48"           # FOLDER
export COLOR_14="#b296c6"           #
export COLOR_15="#f5bfd7"           #
export COLOR_16="#fefbea"           #

export BACKGROUND_COLOR="#010101"   # Background Color
export FOREGROUND_COLOR="#a8a49d"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Harper"
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
