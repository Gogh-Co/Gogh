#!/usr/bin/env bash

export PROFILE_NAME="Quiet"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#C16262"           # Red (Syntax string)
export COLOR_03="#49B685"           # Green (Command)
export COLOR_04="#C5B76D"           # Yellow (Command second)
export COLOR_05="#4992B6"           # Blue (Path)
export COLOR_06="#815BBE"           # Magenta (Syntax var)
export COLOR_07="#41A4A4"           # Cyan (Prompt)
export COLOR_08="#C5C5C5"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#ED5E7A"           # Bright Red (Command error)
export COLOR_11="#7ECE7E"           # Bright Green (Exec)
export COLOR_12="#DBDB70"           # Bright Yellow
export COLOR_13="#4DBFFF"           # Bright Blue (Folder)
export COLOR_14="#C067E4"           # Bright Magenta
export COLOR_15="#70DBD8"           # Bright Cyan
export COLOR_16="#F0F0F0"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#B9B9B9"   # Foreground (Text)

export CURSOR_COLOR="#A0A0A0" # Cursor

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
