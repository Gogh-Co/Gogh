#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#b64c00"           # SYNTAX_STRING
export COLOR_03="#7c8b16"           # COMMAND
export COLOR_04="#d3bd26"           # COMMAND_COLOR2
export COLOR_05="#616bb0"           # PATH
export COLOR_06="#8c5a90"           # SYNTAX_VAR
export COLOR_07="#916c25"           # PROMP
export COLOR_08="#cac29a"           #

export COLOR_09="#5e5219"           #
export COLOR_10="#ff9149"           # COMMAND_ERROR
export COLOR_11="#b2ca3b"           # EXEC
export COLOR_12="#ffe54a"           #
export COLOR_13="#acb8ff"           # FOLDER
export COLOR_14="#ffa0ff"           #
export COLOR_15="#ffbc51"           #
export COLOR_16="#fed698"           #

export BACKGROUND_COLOR="#1d1908"   # Background Color
export FOREGROUND_COLOR="#cac296"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Medallion"
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
