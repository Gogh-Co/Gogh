#!/usr/bin/env bash

export PROFILE_NAME="Crayon Pony Fish"

export COLOR_01="#2b1b1d"           # Black (Host)
export COLOR_02="#91002b"           # Red (Syntax string)
export COLOR_03="#579524"           # Green (Command)
export COLOR_04="#ab311b"           # Yellow (Command second)
export COLOR_05="#8c87b0"           # Blue (Path)
export COLOR_06="#692f50"           # Magenta (Syntax var)
export COLOR_07="#e8a866"           # Cyan (Prompt)
export COLOR_08="#68525a"           # White

export COLOR_09="#3d2b2e"           # Bright Black
export COLOR_10="#c5255d"           # Bright Red (Command error)
export COLOR_11="#8dff57"           # Bright Green (Exec)
export COLOR_12="#c8381d"           # Bright Yellow
export COLOR_13="#cfc9ff"           # Bright Blue (Folder)
export COLOR_14="#fc6cba"           # Bright Magenta
export COLOR_15="#ffceaf"           # Bright Cyan
export COLOR_16="#b0949d"           # Bright White

export BACKGROUND_COLOR="#150707"   # Background
export FOREGROUND_COLOR="#68525a"   # Foreground (Text)

export CURSOR_COLOR="#68525a" # Cursor

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
