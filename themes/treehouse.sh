#!/usr/bin/env bash

export PROFILE_NAME="Treehouse"

export COLOR_01="#321300"           # Black (Host)
export COLOR_02="#b2270e"           # Red (Syntax string)
export COLOR_03="#44a900"           # Green (Command)
export COLOR_04="#aa820c"           # Yellow (Command second)
export COLOR_05="#58859a"           # Blue (Path)
export COLOR_06="#97363d"           # Magenta (Syntax var)
export COLOR_07="#b25a1e"           # Cyan (Prompt)
export COLOR_08="#786b53"           # White

export COLOR_09="#433626"           # Bright Black
export COLOR_10="#ed5d20"           # Bright Red (Command error)
export COLOR_11="#55f238"           # Bright Green (Exec)
export COLOR_12="#f2b732"           # Bright Yellow
export COLOR_13="#85cfed"           # Bright Blue (Folder)
export COLOR_14="#e14c5a"           # Bright Magenta
export COLOR_15="#f07d14"           # Bright Cyan
export COLOR_16="#ffc800"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#786b53"   # Foreground (Text)

export CURSOR_COLOR="#786b53" # Cursor

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
