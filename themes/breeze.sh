#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#232627"           # HOST
export COLOR_02="#ED1515"           # SYNTAX_STRING
export COLOR_03="#11D116"           # COMMAND
export COLOR_04="#F67400"           # COMMAND_COLOR2
export COLOR_05="#1D99F3"           # PATH
export COLOR_06="#9B59B6"           # SYNTAX_VAR
export COLOR_07="#1ABC9C"           # PROMP
export COLOR_08="#FCFCFC"           # 

export COLOR_09="#7F8C8D"           # 
export COLOR_10="#C0392B"           # COMMAND_ERROR
export COLOR_11="#1CDC9A"           # EXEC
export COLOR_12="#FDBC4B"           # 
export COLOR_13="#3DAEE9"           # FOLDER
export COLOR_14="#8E44AD"           # 
export COLOR_15="#16A085"           # 
export COLOR_16="#FFFFFF"           # 

export BACKGROUND_COLOR="#232627"   # Background Color
export FOREGROUND_COLOR="#FCFCFC"   # Foreground Color (text)
export CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
export PROFILE_NAME="Breeze"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}


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
