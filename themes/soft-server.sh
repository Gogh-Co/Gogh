#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#a2686a"           # SYNTAX_STRING
export COLOR_03="#9aa56a"           # COMMAND
export COLOR_04="#a3906a"           # COMMAND_COLOR2
export COLOR_05="#6b8fa3"           # PATH
export COLOR_06="#6a71a3"           # SYNTAX_VAR
export COLOR_07="#6ba58f"           # PROMP
export COLOR_08="#99a3a2"           #

export COLOR_09="#666c6c"           #
export COLOR_10="#dd5c60"           # COMMAND_ERROR
export COLOR_11="#bfdf55"           # EXEC
export COLOR_12="#deb360"           #
export COLOR_13="#62b1df"           # FOLDER
export COLOR_14="#606edf"           #
export COLOR_15="#64e39c"           #
export COLOR_16="#d2e0de"           #

export BACKGROUND_COLOR="#242626"   # Background Color
export FOREGROUND_COLOR="#99a3a2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Soft Server"
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
