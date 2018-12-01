#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282828"          # HOST
export COLOR_02="#cc241d"          # SYNTAX_STRING
export COLOR_03="#98971a"          # COMMAND
export COLOR_04="#d79921"          # COMMAND_COLOR2
export COLOR_05="#458588"          # PATH
export COLOR_06="#b16286"          # SYNTAX_VAR
export COLOR_07="#689d6a"          # PROMP
export COLOR_08="#a89984"          #

export COLOR_09="#928374"          #
export COLOR_10="#fb4934"          # COMMAND_ERROR
export COLOR_11="#b8bb26"          # EXEC
export COLOR_12="#fabd2f"          #
export COLOR_13="#83a598"          # FOLDER
export COLOR_14="#d3869b"          #
export COLOR_15="#8ec07c"          #
export COLOR_16="#ebdbb2"          #

export BACKGROUND_COLOR="#282828"  # Background Color
export FOREGROUND_COLOR="#ebdbb2"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Gruvbox Dark"
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
