#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#ff4242"           # SYNTAX_STRING
export COLOR_03="#74af68"           # COMMAND
export COLOR_04="#ffad29"           # COMMAND_COLOR2
export COLOR_05="#338f86"           # PATH
export COLOR_06="#9414e6"           # SYNTAX_VAR
export COLOR_07="#23d7d7"           # PROMP
export COLOR_08="#e1e1e0"           #

export COLOR_09="#555555"           #
export COLOR_10="#ff3242"           # COMMAND_ERROR
export COLOR_11="#74cd68"           # EXEC
export COLOR_12="#ffb929"           #
export COLOR_13="#23d7d7"           # FOLDER
export COLOR_14="#ff37ff"           #
export COLOR_15="#00ede1"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#2d3743"   # Background Color
export FOREGROUND_COLOR="#e1e1e0"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Misterioso"
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
