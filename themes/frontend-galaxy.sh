#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#000000"           # HOST
export COLOR_02="#f9555f"           # SYNTAX_STRING
export COLOR_03="#21b089"           # COMMAND
export COLOR_04="#fef02a"           # COMMAND_COLOR2
export COLOR_05="#589df6"           # PATH
export COLOR_06="#944d95"           # SYNTAX_VAR
export COLOR_07="#1f9ee7"           # PROMP
export COLOR_08="#bbbbbb"           #

export COLOR_09="#555555"           #
export COLOR_10="#fa8c8f"           # COMMAND_ERROR
export COLOR_11="#35bb9a"           # EXEC
export COLOR_12="#ffff55"           #
export COLOR_13="#589df6"           # FOLDER
export COLOR_14="#e75699"           #
export COLOR_15="#3979bc"           #
export COLOR_16="#ffffff"           #

export BACKGROUND_COLOR="#1d2837"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Frontend Galaxy"
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
