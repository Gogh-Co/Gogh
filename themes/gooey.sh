#!/usr/bin/env bash

export PROFILE_NAME="Gooey"

export COLOR_01="#000009"           # Black (Host)
export COLOR_02="#BB4F6C"           # Red (Syntax string)
export COLOR_03="#72CCAE"           # Green (Command)
export COLOR_04="#C65E3D"           # Yellow (Command second)
export COLOR_05="#58B6CA"           # Blue (Path)
export COLOR_06="#6488C4"           # Magenta (Syntax var)
export COLOR_07="#8D84C6"           # Cyan (Prompt)
export COLOR_08="#858893"           # White

export COLOR_09="#1F222D"           # Bright Black
export COLOR_10="#EE829F"           # Bright Red (Command error)
export COLOR_11="#A5FFE1"           # Bright Green (Exec)
export COLOR_12="#F99170"           # Bright Yellow
export COLOR_13="#8BE9FD"           # Bright Blue (Folder)
export COLOR_14="#97BBF7"           # Bright Magenta
export COLOR_15="#C0B7F9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D101B"   # Background
export FOREGROUND_COLOR="#EBEEF9"   # Foreground (Text)

export CURSOR_COLOR="#EBEEF9" # Cursor

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
