#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2d283f"           # HOST
export COLOR_02="#ed2261"           # SYNTAX_STRING
export COLOR_03="#1fa91b"           # COMMAND
export COLOR_04="#8ddc20"           # COMMAND_COLOR2
export COLOR_05="#487df4"           # PATH
export COLOR_06="#8d35c9"           # SYNTAX_VAR
export COLOR_07="#3bdeed"           # PROMP
export COLOR_08="#9e9ea0"           #

export COLOR_09="#59516a"           #
export COLOR_10="#f0729a"           # COMMAND_ERROR
export COLOR_11="#53aa5e"           # EXEC
export COLOR_12="#b2dc87"           #
export COLOR_13="#a9bcec"           # FOLDER
export COLOR_14="#ad81c2"           #
export COLOR_15="#9de3eb"           #
export COLOR_16="#a288f7"           #

export BACKGROUND_COLOR="#171423"   # Background Color
export FOREGROUND_COLOR="#9f9fa1"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Grape"
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
