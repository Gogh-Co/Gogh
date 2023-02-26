#!/usr/bin/env bash

export PROFILE_NAME="Thayer Bright"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#F92672"           # Red (Syntax string)
export COLOR_03="#4DF840"           # Green (Command)
export COLOR_04="#F4FD22"           # Yellow (Command second)
export COLOR_05="#2757D6"           # Blue (Path)
export COLOR_06="#8C54FE"           # Magenta (Syntax var)
export COLOR_07="#38C8B5"           # Cyan (Prompt)
export COLOR_08="#CCCCC6"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#FF5995"           # Bright Red (Command error)
export COLOR_11="#B6E354"           # Bright Green (Exec)
export COLOR_12="#FEED6C"           # Bright Yellow
export COLOR_13="#3F78FF"           # Bright Blue (Folder)
export COLOR_14="#9E6FFE"           # Bright Magenta
export COLOR_15="#23CFD5"           # Bright Cyan
export COLOR_16="#F8F8F2"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
export FOREGROUND_COLOR="#F8F8F8"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F8" # Cursor

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
