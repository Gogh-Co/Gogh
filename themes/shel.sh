#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2c2423"           # HOST
export COLOR_02="#ab2463"           # SYNTAX_STRING
export COLOR_03="#6ca323"           # COMMAND
export COLOR_04="#ab6423"           # COMMAND_COLOR2
export COLOR_05="#2c64a2"           # PATH
export COLOR_06="#6c24a2"           # SYNTAX_VAR
export COLOR_07="#2ca363"           # PROMP
export COLOR_08="#918988"           #

export COLOR_09="#918988"           #
export COLOR_10="#f588b9"           # COMMAND_ERROR
export COLOR_11="#c2ee86"           # EXEC
export COLOR_12="#f5ba86"           #
export COLOR_13="#8fbaec"           # FOLDER
export COLOR_14="#c288ec"           #
export COLOR_15="#8feeb9"           #
export COLOR_16="#f5eeec"           #

export BACKGROUND_COLOR="#2a201f"   # Background Color
export FOREGROUND_COLOR="#4882cd"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Shel"
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
