#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#073641"
export COLOR_02="#EB606B"
export COLOR_03="#C3E88D"
export COLOR_04="#F7EB95"
export COLOR_05="#80CBC3"
export COLOR_06="#FF2490"
export COLOR_07="#AEDDFF"
export COLOR_08="#FFFFFF"

export COLOR_09="#002B36"
export COLOR_10="#EB606B"
export COLOR_11="#C3E88D"
export COLOR_12="#F7EB95"
export COLOR_13="#7DC6BF"
export COLOR_14="#6C71C3"
export COLOR_15="#34434D"
export COLOR_16="#FFFFFF"

export BACKGROUND_COLOR="#1E282C"
export FOREGROUND_COLOR="#C3C7D1"
export CURSOR_COLOR="#657B83"
export PROFILE_NAME="Material"
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
