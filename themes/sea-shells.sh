#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#17384c"           # HOST
export COLOR_02="#d15123"           # SYNTAX_STRING
export COLOR_03="#027c9b"           # COMMAND
export COLOR_04="#fca02f"           # COMMAND_COLOR2
export COLOR_05="#1e4950"           # PATH
export COLOR_06="#68d4f1"           # SYNTAX_VAR
export COLOR_07="#50a3b5"           # PROMP
export COLOR_08="#deb88d"           #

export COLOR_09="#434b53"           #
export COLOR_10="#d48678"           # COMMAND_ERROR
export COLOR_11="#628d98"           # EXEC
export COLOR_12="#fdd39f"           #
export COLOR_13="#1bbcdd"           # FOLDER
export COLOR_14="#bbe3ee"           #
export COLOR_15="#87acb4"           #
export COLOR_16="#fee4ce"           #

export BACKGROUND_COLOR="#09141b"   # Background Color
export FOREGROUND_COLOR="#deb88d"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Sea Shells"
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
