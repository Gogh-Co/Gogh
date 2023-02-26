#!/usr/bin/env bash

export PROFILE_NAME="Solarized Dark Higher Contrast"

export COLOR_01="#002831"           # Black (Host)
export COLOR_02="#d11c24"           # Red (Syntax string)
export COLOR_03="#6cbe6c"           # Green (Command)
export COLOR_04="#a57706"           # Yellow (Command second)
export COLOR_05="#2176c7"           # Blue (Path)
export COLOR_06="#c61c6f"           # Magenta (Syntax var)
export COLOR_07="#259286"           # Cyan (Prompt)
export COLOR_08="#eae3cb"           # White

export COLOR_09="#006488"           # Bright Black
export COLOR_10="#f5163b"           # Bright Red (Command error)
export COLOR_11="#51ef84"           # Bright Green (Exec)
export COLOR_12="#b27e28"           # Bright Yellow
export COLOR_13="#178ec8"           # Bright Blue (Folder)
export COLOR_14="#e24d8e"           # Bright Magenta
export COLOR_15="#00b39e"           # Bright Cyan
export COLOR_16="#fcf4dc"           # Bright White

export BACKGROUND_COLOR="#001e27"   # Background
export FOREGROUND_COLOR="#9cc2c3"   # Foreground (Text)

export CURSOR_COLOR="#9cc2c3" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
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
