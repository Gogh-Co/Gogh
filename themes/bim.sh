#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2c2423"           # HOST
export COLOR_02="#f557a0"           # SYNTAX_STRING
export COLOR_03="#a9ee55"           # COMMAND
export COLOR_04="#f5a255"           # COMMAND_COLOR2
export COLOR_05="#5ea2ec"           # PATH
export COLOR_06="#a957ec"           # SYNTAX_VAR
export COLOR_07="#5eeea0"           # PROMP
export COLOR_08="#918988"           #

export COLOR_09="#918988"           #
export COLOR_10="#f579b2"           # COMMAND_ERROR
export COLOR_11="#bbee78"           # EXEC
export COLOR_12="#f5b378"           #
export COLOR_13="#81b3ec"           # FOLDER
export COLOR_14="#bb79ec"           #
export COLOR_15="#81eeb2"           #
export COLOR_16="#f5eeec"           #

export BACKGROUND_COLOR="#012849"   # Background Color
export FOREGROUND_COLOR="#a9bed8"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Bim"
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
