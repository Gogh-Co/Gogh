#!/usr/bin/env bash

export PROFILE_NAME="Selenized White"

export COLOR_01="#ebebeb"           # Black (Host)
export COLOR_02="#d6000c"           # Red (Syntax string)
export COLOR_03="#1d9700"           # Green (Command)
export COLOR_04="#c49700"           # Yellow (Command second)
export COLOR_05="#0064e4"           # Blue (Path)
export COLOR_06="#dd0f9d"           # Magenta (Syntax var)
export COLOR_07="#00ad9c"           # Cyan (Prompt)
export COLOR_08="#878787"           # White

export COLOR_09="#cdcdcd"           # Bright Black
export COLOR_10="#bf0000"           # Bright Red (Command error)
export COLOR_11="#008400"           # Bright Green (Exec)
export COLOR_12="#af8500"           # Bright Yellow
export COLOR_13="#0054cf"           # Bright Blue (Folder)
export COLOR_14="#c7008b"           # Bright Magenta
export COLOR_15="#009a8a"           # Bright Cyan
export COLOR_16="#282828"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#474747"   # Foreground (Text)

export CURSOR_COLOR="#282828" # Cursor

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
