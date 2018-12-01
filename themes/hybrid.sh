#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#282a2e"           # HOST
export COLOR_02="#A54242"           # SYNTAX_STRING
export COLOR_03="#8C9440"           # COMMAND
export COLOR_04="#de935f"           # COMMAND_COLOR2
export COLOR_05="#5F819D"           # PATH
export COLOR_06="#85678F"           # SYNTAX_VAR
export COLOR_07="#5E8D87"           # PROMP
export COLOR_08="#969896"           #

export COLOR_09="#373b41"           #
export COLOR_10="#cc6666"           # COMMAND_ERROR
export COLOR_11="#b5bd68"           # EXEC
export COLOR_12="#f0c674"           #
export COLOR_13="#81a2be"           # FOLDER
export COLOR_14="#b294bb"           #
export COLOR_15="#8abeb7"           #
export COLOR_16="#c5c8c6"           #

export BACKGROUND_COLOR="#141414"   # Background Color
export FOREGROUND_COLOR="#94a3a5"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Hybrid"
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
