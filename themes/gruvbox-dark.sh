#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Dark"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#cc241d"           # Red (Syntax string)
export COLOR_03="#98971a"           # Green (Command)
export COLOR_04="#d79921"           # Yellow (Command second)
export COLOR_05="#458588"           # Blue (Path)
export COLOR_06="#b16286"           # Magenta (Syntax var)
export COLOR_07="#689d6a"           # Cyan (Prompt)
export COLOR_08="#a89984"           # White

export COLOR_09="#928374"           # Bright Black
export COLOR_10="#fb4934"           # Bright Red (Command error)
export COLOR_11="#b8bb26"           # Bright Green (Exec)
export COLOR_12="#fabd2f"           # Bright Yellow
export COLOR_13="#83a598"           # Bright Blue (Folder)
export COLOR_14="#d3869b"           # Bright Magenta
export COLOR_15="#8ec07c"           # Bright Cyan
export COLOR_16="#ebdbb2"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#ebdbb2"   # Foreground (Text)

export CURSOR_COLOR="#ebdbb2" # Cursor

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
