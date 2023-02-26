#!/usr/bin/env bash

export PROFILE_NAME="Ura"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C21B6F"           # Red (Syntax string)
export COLOR_03="#6FC21B"           # Green (Command)
export COLOR_04="#C26F1B"           # Yellow (Command second)
export COLOR_05="#1B6FC2"           # Blue (Path)
export COLOR_06="#6F1BC2"           # Magenta (Syntax var)
export COLOR_07="#1BC26F"           # Cyan (Prompt)
export COLOR_08="#808080"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#EE84B9"           # Bright Red (Command error)
export COLOR_11="#B9EE84"           # Bright Green (Exec)
export COLOR_12="#EEB984"           # Bright Yellow
export COLOR_13="#84B9EE"           # Bright Blue (Folder)
export COLOR_14="#B984EE"           # Bright Magenta
export COLOR_15="#84EEB9"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#FEFFEE"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

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
