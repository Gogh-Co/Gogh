#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3d352a"           # HOST
export COLOR_02="#cd5c5c"           # SYNTAX_STRING
export COLOR_03="#86af80"           # COMMAND
export COLOR_04="#e8ae5b"           # COMMAND_COLOR2
export COLOR_05="#6495ed"           # PATH
export COLOR_06="#deb887"           # SYNTAX_VAR
export COLOR_07="#b0c4de"           # PROMP
export COLOR_08="#bbaa99"           #

export COLOR_09="#554444"           #
export COLOR_10="#cc5533"           # COMMAND_ERROR
export COLOR_11="#88aa22"           # EXEC
export COLOR_12="#ffa75d"           #
export COLOR_13="#87ceeb"           # FOLDER
export COLOR_14="#996600"           #
export COLOR_15="#b0c4de"           #
export COLOR_16="#ddccbb"           #

export BACKGROUND_COLOR="#1c1c1c"   # Background Color
export FOREGROUND_COLOR="#ddeedd"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Arthur"
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
