#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#040404"           # HOST
export COLOR_02="#0f49c4"           # SYNTAX_STRING
export COLOR_03="#48b117"           # COMMAND
export COLOR_04="#e87324"           # COMMAND_COLOR2
export COLOR_05="#bc0116"           # PATH
export COLOR_06="#665b93"           # SYNTAX_VAR
export COLOR_07="#70a699"           # PROMP
export COLOR_08="#f5dcbe"           #

export COLOR_09="#4f7cbf"           #
export COLOR_10="#1c96c7"           # COMMAND_ERROR
export COLOR_11="#3bff6f"           # EXEC
export COLOR_12="#efc31c"           #
export COLOR_13="#fb605b"           # FOLDER
export COLOR_14="#975b5a"           #
export COLOR_15="#1eff8e"           #
export COLOR_16="#f6f5fb"           #

export BACKGROUND_COLOR="#211f46"   # Background Color
export FOREGROUND_COLOR="#ffffff"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Morada"
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
