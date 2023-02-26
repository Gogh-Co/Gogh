#!/usr/bin/env bash

export PROFILE_NAME="Thayer Bright"

export COLOR_01="#1b1d1e"           # Black (Host)
export COLOR_02="#f92672"           # Red (Syntax string)
export COLOR_03="#4df840"           # Green (Command)
export COLOR_04="#f4fd22"           # Yellow (Command second)
export COLOR_05="#2757d6"           # Blue (Path)
export COLOR_06="#8c54fe"           # Magenta (Syntax var)
export COLOR_07="#38c8b5"           # Cyan (Prompt)
export COLOR_08="#ccccc6"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#ff5995"           # Bright Red (Command error)
export COLOR_11="#b6e354"           # Bright Green (Exec)
export COLOR_12="#feed6c"           # Bright Yellow
export COLOR_13="#3f78ff"           # Bright Blue (Folder)
export COLOR_14="#9e6ffe"           # Bright Magenta
export COLOR_15="#23cfd5"           # Bright Cyan
export COLOR_16="#f8f8f2"           # Bright White

export BACKGROUND_COLOR="#1b1d1e"   # Background
export FOREGROUND_COLOR="#f8f8f8"   # Foreground (Text)

export CURSOR_COLOR="#f8f8f8" # Cursor

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
