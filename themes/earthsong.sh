#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#121418"           # HOST
export COLOR_02="#c94234"           # SYNTAX_STRING
export COLOR_03="#85c54c"           # COMMAND
export COLOR_04="#f5ae2e"           # COMMAND_COLOR2
export COLOR_05="#1398b9"           # PATH
export COLOR_06="#d0633d"           # SYNTAX_VAR
export COLOR_07="#509552"           # PROMP
export COLOR_08="#e5c6aa"           #

export COLOR_09="#675f54"           #
export COLOR_10="#ff645a"           # COMMAND_ERROR
export COLOR_11="#98e036"           # EXEC
export COLOR_12="#e0d561"           #
export COLOR_13="#5fdaff"           # FOLDER
export COLOR_14="#ff9269"           #
export COLOR_15="#84f088"           #
export COLOR_16="#f6f7ec"           #

export BACKGROUND_COLOR="#292520"   # Background Color
export FOREGROUND_COLOR="#e5c7a9"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Earthsong"
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
