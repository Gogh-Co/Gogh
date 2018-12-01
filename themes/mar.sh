#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#b5407b"           # SYNTAX_STRING
export COLOR_03="#7bb540"           # COMMAND
export COLOR_04="#b57b40"           # COMMAND_COLOR2
export COLOR_05="#407bb5"           # PATH
export COLOR_06="#7b40b5"           # SYNTAX_VAR
export COLOR_07="#40b57b"           # PROMP
export COLOR_08="#f8f8f8"           #

export COLOR_09="#737373"           #
export COLOR_10="#cd73a0"           # COMMAND_ERROR
export COLOR_11="#a0cd73"           # EXEC
export COLOR_12="#cda073"           #
export COLOR_13="#73a0cd"           # FOLDER
export COLOR_14="#a073cd"           #
export COLOR_15="#73cda0"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#ffffff"   # Background Color
export FOREGROUND_COLOR="#23476a"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Mar"
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
