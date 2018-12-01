#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2b2b2b"           # HOST
export COLOR_02="#d45a60"           # SYNTAX_STRING
export COLOR_03="#afba67"           # COMMAND
export COLOR_04="#e5d289"           # COMMAND_COLOR2
export COLOR_05="#a0bad6"           # PATH
export COLOR_06="#c092d6"           # SYNTAX_VAR
export COLOR_07="#91bfb7"           # PROMP
export COLOR_08="#3c3d3d"           #

export COLOR_09="#454747"           #
export COLOR_10="#d3232f"           # COMMAND_ERROR
export COLOR_11="#aabb39"           # EXEC
export COLOR_12="#e5be39"           #
export COLOR_13="#6699d6"           # FOLDER
export COLOR_14="#ab53d6"           #
export COLOR_15="#5fc0ae"           #
export COLOR_16="#c1c2c2"           #

export BACKGROUND_COLOR="#222222"   # Background Color
export FOREGROUND_COLOR="#959595"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Later This Evening"
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
