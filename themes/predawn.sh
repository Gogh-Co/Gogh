#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#F18260"          # HOST
export COLOR_02="#b51a20"          # SYNTAX_STRING
export COLOR_03="#a6cc75"          # COMMAND
export COLOR_04="#fed33a"          # COMMAND_COLOR2
export COLOR_05="#81b2b1"          # PATH
export COLOR_06="#eb6c4e"          # SYNTAX_VAR
export COLOR_07="#81b2b1"          # PROMP
export COLOR_08="#eaeaea"          #

export COLOR_09="#666666"          #
export COLOR_10="#ff000b"          # COMMAND_ERROR
export COLOR_11="#c4ee94"          # EXEC
export COLOR_12="#e8e06d"          #
export COLOR_13="#a5ebea"          # FOLDER
export COLOR_14="#ef8a50"          #
export COLOR_15="#a5ebea"          #
export COLOR_16="#ffffff"          #

export BACKGROUND_COLOR="#282828"  # Background Color
export FOREGROUND_COLOR="#F1F1F1"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Predawn"
# =============================================================== #







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
