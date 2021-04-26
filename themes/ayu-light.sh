#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#575F66"           # HOST
export COLOR_02="#F51818"           # SYNTAX_STRING
export COLOR_03="#86B300"           # COMMAND
export COLOR_04="#F2AE49"           # COMMAND_COLOR2
export COLOR_05="#399EE6"           # PATH
export COLOR_06="#A37ACC"           # SYNTAX_VAR
export COLOR_07="#4CBF99"           # PROMP
export COLOR_08="#FAFAFA"           #

export COLOR_09="#8A9199"           #
export COLOR_10="#F51818"           # COMMAND_ERROR
export COLOR_11="#86B300"           # EXEC
export COLOR_12="#F2AE49"           #
export COLOR_13="#399EE6"           # FOLDER
export COLOR_14="#A37ACC"           #
export COLOR_15="#4CBF99"           #
export COLOR_16="#FAFAFA"           #

export BACKGROUND_COLOR="#FAFAFA"   # Background Color
export FOREGROUND_COLOR="#575F66"   # Foreground Color (text)
export CURSOR_COLOR="#FF9940" # Cursor color
export PROFILE_NAME="Ayu Light"
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
