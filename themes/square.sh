#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#050505"           # HOST
export COLOR_02="#e9897c"           # SYNTAX_STRING
export COLOR_03="#b6377d"           # COMMAND
export COLOR_04="#ecebbe"           # COMMAND_COLOR2
export COLOR_05="#a9cdeb"           # PATH
export COLOR_06="#75507b"           # SYNTAX_VAR
export COLOR_07="#c9caec"           # PROMP
export COLOR_08="#f2f2f2"           #

export COLOR_09="#141414"           #
export COLOR_10="#f99286"           # COMMAND_ERROR
export COLOR_11="#c3f786"           # EXEC
export COLOR_12="#fcfbcc"           #
export COLOR_13="#b6defb"           # FOLDER
export COLOR_14="#ad7fa8"           #
export COLOR_15="#d7d9fc"           #
export COLOR_16="#e2e2e2"           #

export BACKGROUND_COLOR="#0a1e24"   # Background Color
export FOREGROUND_COLOR="#a1a1a1"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Square"
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
