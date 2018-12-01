#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#fbf1c7"           # HOST
export COLOR_02="#cc241d"           # SYNTAX_STRING
export COLOR_03="#98971a"           # COMMAND
export COLOR_04="#d79921"           # COMMAND_COLOR2
export COLOR_05="#458588"           # PATH
export COLOR_06="#b16286"           # SYNTAX_VAR
export COLOR_07="#689d6a"           # PROMP
export COLOR_08="#7c6f64"           #

export COLOR_09="#928374"           #
export COLOR_10="#9d0006"           # COMMAND_ERROR
export COLOR_11="#79740e"           # EXEC
export COLOR_12="#b57614"           #
export COLOR_13="#076678"           # FOLDER
export COLOR_14="#8f3f71"           #
export COLOR_15="#427b58"           #
export COLOR_16="#3c3836"           #

export BACKGROUND_COLOR="#fbf1c7"   # Background Color
export FOREGROUND_COLOR="#3c3836"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Gruvbox"
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
