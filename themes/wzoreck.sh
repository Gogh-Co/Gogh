#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2E3436"           # HOST
export COLOR_02="#FC6386"           # SYNTAX_STRING
export COLOR_03="#424043"           # COMMAND
export COLOR_04="#FCE94F"           # COMMAND_COLOR2
export COLOR_05="#FB976B"           # PATH
export COLOR_06="#75507B"           # SYNTAX_VAR
export COLOR_07="#34E2E2"           # PROMP
export COLOR_08="#FFFFFF"           #

export COLOR_09="#989595"           #
export COLOR_10="#FC6386"           # COMMAND_ERROR
export COLOR_11="#A9DC76"           # EXEC
export COLOR_12="#FCE94F"           #
export COLOR_13="#FB976B"           #
export COLOR_14="#AB9DF2"           #
export COLOR_15="#34E2E2"           #
export COLOR_16="#D1D1C0"           #

export BACKGROUND_COLOR="#424043"   # Background Color
export FOREGROUND_COLOR="#FCFCFA"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Wzoreck"
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
