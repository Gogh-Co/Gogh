#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1C1B19"           # HOST
export COLOR_02="#FF3128"           # SYNTAX_STRING
export COLOR_03="#519F50"           # COMMAND
export COLOR_04="#FBB829"           # COMMAND_COLOR2
export COLOR_05="#5573A3"           # PATH
export COLOR_06="#E02C6D"           # SYNTAX_VAR
export COLOR_07="#0AAEB3"           # PROMP
export COLOR_08="#918175"           #

export COLOR_09="#2D2B28"           #
export COLOR_10="#F75341"           # COMMAND_ERROR
export COLOR_11="#98BC37"           # EXEC
export COLOR_12="#FED06E"           #
export COLOR_13="#8EB2F7"           # FOLDER
export COLOR_14="#E35682"           #
export COLOR_15="#53FDE9"           #
export COLOR_16="#FCE8C3"           #

export BACKGROUND_COLOR="#282828"   # Background Color
export FOREGROUND_COLOR="#ebdbb2"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Srcery"
# =============================================







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
