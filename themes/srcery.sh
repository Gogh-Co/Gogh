#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#1c1b19"           # HOST
export COLOR_02="#ef2f27"           # SYNTAX_STRING
export COLOR_03="#519f50"           # COMMAND
export COLOR_04="#fbb829"           # COMMAND_COLOR2
export COLOR_05="#2c78bf"           # PATH
export COLOR_06="#e02c6d"           # SYNTAX_VAR
export COLOR_07="#0aaeb3"           # PROMP
export COLOR_08="#baa67f"           #

export COLOR_09="#918175"           #
export COLOR_10="#f75341"           # COMMAND_ERROR
export COLOR_11="#98bc37"           # EXEC
export COLOR_12="#fed06e"           #
export COLOR_13="#68a8e4"           # FOLDER
export COLOR_14="#ff5c8f"           #
export COLOR_15="#2be4d0"           #
export COLOR_16="#fce8c3"           #

export BACKGROUND_COLOR="#1c1b19"   # Background Color
export FOREGROUND_COLOR="#fce8c3"   # Text
export CURSOR_COLOR="#fbb829" # Cursor
export PROFILE_NAME="Srcery"
# =============================================







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


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
