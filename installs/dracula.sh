#!/usr/bin/env bash

export PROFILE_NAME="Dracula"

export COLOR_01="#44475A"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#50FA7B"           # Green (Command)
export COLOR_04="#FFB86C"           # Yellow (Command second)
export COLOR_05="#8BE9FD"           # Blue (Path)
export COLOR_06="#BD93F9"           # Magenta (Syntax var)
export COLOR_07="#FF79C6"           # Cyan (Prompt)
export COLOR_08="#f8f8f2"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#50FA7B"           # Bright Green (Exec)
export COLOR_12="#FFB86C"           # Bright Yellow
export COLOR_13="#8BE9FD"           # Bright Blue (Folder)
export COLOR_14="#BD93F9"           # Bright Magenta
export COLOR_15="#FF79C6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282A36"   # Background
export FOREGROUND_COLOR="#f8f8f2"   # Foreground (Text)

export CURSOR_COLOR="#f8f8f2" # Cursor

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
