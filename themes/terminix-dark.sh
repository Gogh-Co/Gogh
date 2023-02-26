#!/usr/bin/env bash

export PROFILE_NAME="Terminix Dark"

export COLOR_01="#282a2e"           # Black (Host)
export COLOR_02="#a54242"           # Red (Syntax string)
export COLOR_03="#a1b56c"           # Green (Command)
export COLOR_04="#de935f"           # Yellow (Command second)
export COLOR_05="#225555"           # Blue (Path)
export COLOR_06="#85678f"           # Magenta (Syntax var)
export COLOR_07="#5e8d87"           # Cyan (Prompt)
export COLOR_08="#777777"           # White

export COLOR_09="#373b41"           # Bright Black
export COLOR_10="#c63535"           # Bright Red (Command error)
export COLOR_11="#608360"           # Bright Green (Exec)
export COLOR_12="#fa805a"           # Bright Yellow
export COLOR_13="#449da1"           # Bright Blue (Folder)
export COLOR_14="#ba8baf"           # Bright Magenta
export COLOR_15="#86c1b9"           # Bright Cyan
export COLOR_16="#c5c8c6"           # Bright White

export BACKGROUND_COLOR="#091116"   # Background
export FOREGROUND_COLOR="#868A8C"   # Foreground (Text)

export CURSOR_COLOR="#868A8C" # Cursor

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
