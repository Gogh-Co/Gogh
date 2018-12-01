#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"          # HOST
export COLOR_02="#dd0007"          # SYNTAX_STRING
export COLOR_03="#07dd00"          # COMMAND
export COLOR_04="#ddd600"          # COMMAND_COLOR2
export COLOR_05="#0007dd"          # PATH
export COLOR_06="#d600dd"          # SYNTAX_VAR
export COLOR_07="#00ddd6"          # PROMP
export COLOR_08="#f2f2f2"          #

export COLOR_09="#7d7d7d"          #
export COLOR_10="#ff7478"          # COMMAND_ERROR
export COLOR_11="#78ff74"          # EXEC
export COLOR_12="#fffa74"          #
export COLOR_13="#7478ff"          # FOLDER
export COLOR_14="#fa74ff"          #
export COLOR_15="#74fffa"          #
export COLOR_16="#ffffff"          #

export BACKGROUND_COLOR="#758480"  # Background Color
export FOREGROUND_COLOR="#23476a"  # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Sat"
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
