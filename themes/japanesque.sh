#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#343935"           # HOST
export COLOR_02="#cf3f61"           # SYNTAX_STRING
export COLOR_03="#7bb75b"           # COMMAND
export COLOR_04="#e9b32a"           # COMMAND_COLOR2
export COLOR_05="#4c9ad4"           # PATH
export COLOR_06="#a57fc4"           # SYNTAX_VAR
export COLOR_07="#389aad"           # PROMP
export COLOR_08="#fafaf6"           #

export COLOR_09="#595b59"           #
export COLOR_10="#d18fa6"           # COMMAND_ERROR
export COLOR_11="#767f2c"           # EXEC
export COLOR_12="#78592f"           #
export COLOR_13="#135979"           # FOLDER
export COLOR_14="#604291"           #
export COLOR_15="#76bbca"           #
export COLOR_16="#b2b5ae"           #

export BACKGROUND_COLOR="#1e1e1e"   # Background Color
export FOREGROUND_COLOR="#f7f6ec"   # Text
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
export PROFILE_NAME="Japanesque"
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
