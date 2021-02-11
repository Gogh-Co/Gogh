#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
export COLOR_01="#2f2942"
export COLOR_02="#ff857f"
export COLOR_03="#48b685"
export COLOR_04="#e6c000"
export COLOR_05="#ae81ff"
export COLOR_06="#ef6155"
export COLOR_07="#c2ffdf"
export COLOR_08="#f8f8f2"

export COLOR_09="#75507b"
export COLOR_10="#f1568e"
export COLOR_11="#5adba2"
export COLOR_12="#d5a425"
export COLOR_13="#c5a3ff"
export COLOR_14="#ef6155"
export COLOR_15="#c2ffff"
export COLOR_16="#f8f8f0"

export BACKGROUND_COLOR="#241f33"
export FOREGROUND_COLOR="#d1cae8"
export CURSOR_COLOR="#d1cae8"
export PROFILE_NAME="Pixiefloss"
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
