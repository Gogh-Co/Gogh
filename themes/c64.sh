#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#090300"           # HOST
export COLOR_02="#883932"           # SYNTAX_STRING
export COLOR_03="#55a049"           # COMMAND
export COLOR_04="#bfce72"           # COMMAND_COLOR2
export COLOR_05="#40318d"           # PATH
export COLOR_06="#8b3f96"           # SYNTAX_VAR
export COLOR_07="#67b6bd"           # PROMP
export COLOR_08="#ffffff"           #

export COLOR_09="#000000"           #
export COLOR_10="#883932"           # COMMAND_ERROR
export COLOR_11="#55a049"           # EXEC
export COLOR_12="#bfce72"           #
export COLOR_13="#40318d"           # FOLDER
export COLOR_14="#8b3f96"           #
export COLOR_15="#67b6bd"           #
export COLOR_16="#f7f7f7"           #

export BACKGROUND_COLOR="#40318d"   # Background Color
export FOREGROUND_COLOR="#7869c4"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="C64"
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
