#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#7E0008"           # SYNTAX_STRING
export COLOR_03="#098003"           # COMMAND
export COLOR_04="#C4A000"           # COMMAND_COLOR2
export COLOR_05="#010083"           # PATH
export COLOR_06="#D33682"           # SYNTAX_VAR
export COLOR_07="#0E807F"           # PROMP
export COLOR_08="#7F7C7F"           #

export COLOR_09="#808080"           #
export COLOR_10="#EF2929"           # COMMAND_ERROR
export COLOR_11="#1CFE3C"           # EXEC
export COLOR_12="#FEFE45"           #
export COLOR_13="#268AD2"           # FOLDER
export COLOR_14="#FE13FA"           #
export COLOR_15="#29FFFE"           #
export COLOR_16="#C2C1C3"           #

export BACKGROUND_COLOR="#052454"   # Background Color
export FOREGROUND_COLOR="#F6F6F7"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="PowerShell"
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
