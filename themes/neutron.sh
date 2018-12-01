#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#23252b"           # HOST
export COLOR_02="#b54036"           # SYNTAX_STRING
export COLOR_03="#5ab977"           # COMMAND
export COLOR_04="#deb566"           # COMMAND_COLOR2
export COLOR_05="#6a7c93"           # PATH
export COLOR_06="#a4799d"           # SYNTAX_VAR
export COLOR_07="#3f94a8"           # PROMP
export COLOR_08="#e6e8ef"           #

export COLOR_09="#23252b"           #
export COLOR_10="#b54036"           # COMMAND_ERROR
export COLOR_11="#5ab977"           # EXEC
export COLOR_12="#deb566"           #
export COLOR_13="#6a7c93"           # FOLDER
export COLOR_14="#a4799d"           #
export COLOR_15="#3f94a8"           #
export COLOR_16="#ebedf2"           #

export BACKGROUND_COLOR="#1c1e22"   # Background Color
export FOREGROUND_COLOR="#e6e8ef"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Neutron"
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
