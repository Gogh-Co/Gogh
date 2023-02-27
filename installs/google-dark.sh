#!/usr/bin/env bash

export PROFILE_NAME="Google Dark"

export COLOR_01="#202124"           # Black (Host)
export COLOR_02="#EA4335"           # Red (Syntax string)
export COLOR_03="#34A853"           # Green (Command)
export COLOR_04="#FBBC04"           # Yellow (Command second)
export COLOR_05="#4285F4"           # Blue (Path)
export COLOR_06="#A142F4"           # Magenta (Syntax var)
export COLOR_07="#24C1E0"           # Cyan (Prompt)
export COLOR_08="#E8EAED"           # White

export COLOR_09="#5F6368"           # Bright Black
export COLOR_10="#EA4335"           # Bright Red (Command error)
export COLOR_11="#34A853"           # Bright Green (Exec)
export COLOR_12="#FBBC05"           # Bright Yellow
export COLOR_13="#4285F4"           # Bright Blue (Folder)
export COLOR_14="#A142F4"           # Bright Magenta
export COLOR_15="#24C1E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#202124"   # Background
export FOREGROUND_COLOR="#E8EAED"   # Foreground (Text)

export CURSOR_COLOR="#E8EAED" # Cursor

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
