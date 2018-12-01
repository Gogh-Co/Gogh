#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#3c3c30"           # HOST
export COLOR_02="#98290f"           # SYNTAX_STRING
export COLOR_03="#479a43"           # COMMAND
export COLOR_04="#7f7111"           # COMMAND_COLOR2
export COLOR_05="#497f7d"           # PATH
export COLOR_06="#7f4e2f"           # SYNTAX_VAR
export COLOR_07="#387f58"           # PROMP
export COLOR_08="#807974"           #

export COLOR_09="#555445"           #
export COLOR_10="#e0502a"           # COMMAND_ERROR
export COLOR_11="#61e070"           # EXEC
export COLOR_12="#d69927"           #
export COLOR_13="#79d9d9"           # FOLDER
export COLOR_14="#cd7c54"           #
export COLOR_15="#59d599"           #
export COLOR_16="#fff1e9"           #

export BACKGROUND_COLOR="#22211d"   # Background Color
export FOREGROUND_COLOR="#807a74"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Elemental"
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
