#!/usr/bin/env bash

# ====================  CONFIG THIS ========================================= #
export COLOR_01="#073642"                # HOST
export COLOR_02="#dc322f"                # SYNTAX_STRING
export COLOR_03="#859900"                # COMMAND
export COLOR_04="#b58900"                # COMMAND_COLOR2
export COLOR_05="#268bd2"                # PATH
export COLOR_06="#ec0048"                # SYNTAX_VAR
export COLOR_07="#2aa198"                # PROMP
export COLOR_08="#94a3a5"

export COLOR_09="#586e75"
export COLOR_10="#cb4b16"                # COMMAND_ERROR
export COLOR_11="#859900"                # EXEC
export COLOR_12="#b58900"
export COLOR_13="#268bd2"                # FOLDER
export COLOR_14="#d33682"
export COLOR_15="#2aa198"
export COLOR_16="#6c71c4"

export BACKGROUND_COLOR="#252e32"        # Background Color
export FOREGROUND_COLOR="#94a3a5"        # Text
export CURSOR_COLOR="#839496"            # Cursor
export PROFILE_NAME="Freya"
# =====================  END CONFIG   ======================================= #







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
