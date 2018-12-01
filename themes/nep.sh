#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#dd6f00"           # SYNTAX_STRING
export COLOR_03="#00dd6f"           # COMMAND
export COLOR_04="#6fdd00"           # COMMAND_COLOR2
export COLOR_05="#6f00dd"           # PATH
export COLOR_06="#dd006f"           # SYNTAX_VAR
export COLOR_07="#006fdd"           # PROMP
export COLOR_08="#f2f2f2"           #

export COLOR_09="#7d7d7d"           #
export COLOR_10="#ffb974"           # COMMAND_ERROR
export COLOR_11="#74ffb9"           # EXEC
export COLOR_12="#b9ff74"           #
export COLOR_13="#b974ff"           # FOLDER
export COLOR_14="#ff74b9"           #
export COLOR_15="#74b9ff"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#758480"   # Background Color
export FOREGROUND_COLOR="#23476a"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Nep"
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
