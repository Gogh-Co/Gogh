#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#929292"           # HOST
export COLOR_02="#e27373"           # SYNTAX_STRING
export COLOR_03="#94b979"           # COMMAND
export COLOR_04="#ffba7b"           # COMMAND_COLOR2
export COLOR_05="#97bedc"           # PATH
export COLOR_06="#e1c0fa"           # SYNTAX_VAR
export COLOR_07="#00988e"           # PROMP
export COLOR_08="#dedede"           #

export COLOR_09="#bdbdbd"           #
export COLOR_10="#ffa1a1"           # COMMAND_ERROR
export COLOR_11="#bddeab"           # EXEC
export COLOR_12="#ffdca0"           #
export COLOR_13="#b1d8f6"           # FOLDER
export COLOR_14="#fbdaff"           #
export COLOR_15="#1ab2a8"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#121212"   # Background Color
export FOREGROUND_COLOR="#dedede"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Jellybeans"
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
