#!/usr/bin/env bash

export PROFILE_NAME="Blue Dolphin"

export COLOR_01="#292D3E"           # Black (Host)
export COLOR_02="#FF8288"           # Red (Syntax string)
export COLOR_03="#B4E88D"           # Green (Command)
export COLOR_04="#F4D69F"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#E9C1FF"           # Magenta (Syntax var)
export COLOR_07="#89EBFF"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#434758"           # Bright Black
export COLOR_10="#FF8B92"           # Bright Red (Command error)
export COLOR_11="#DDFFA7"           # Bright Green (Exec)
export COLOR_12="#FFE585"           # Bright Yellow
export COLOR_13="#9CC4FF"           # Bright Blue (Folder)
export COLOR_14="#DDB0F6"           # Bright Magenta
export COLOR_15="#A3F7FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#006984"   # Background
export FOREGROUND_COLOR="#C5F2FF"   # Foreground (Text)

export CURSOR_COLOR="#FFCC00" # Cursor

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
