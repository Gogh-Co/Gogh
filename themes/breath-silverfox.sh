#!/usr/bin/env bash

export PROFILE_NAME="Breath Silverfox"

export COLOR_01="#1e2229"           # Black (Host)
export COLOR_02="#ed1515"           # Red (Syntax string)
export COLOR_03="#44853a"           # Green (Command)
export COLOR_04="#f67400"           # Yellow (Command second)
export COLOR_05="#1d99f3"           # Blue (Path)
export COLOR_06="#9b59b6"           # Magenta (Syntax var)
export COLOR_07="#1abc9c"           # Cyan (Prompt)
export COLOR_08="#fcfcfc"           # White

export COLOR_09="#7f8c8d"           # Bright Black
export COLOR_10="#c0392b"           # Bright Red (Command error)
export COLOR_11="#55a649"           # Bright Green (Exec)
export COLOR_12="#fdbc4b"           # Bright Yellow
export COLOR_13="#3daee9"           # Bright Blue (Folder)
export COLOR_14="#8e44ad"           # Bright Magenta
export COLOR_15="#16a085"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#1e2229"   # Background
export FOREGROUND_COLOR="#bbbbbb"   # Foreground (Text)

export CURSOR_COLOR="#bbbbbb" # Cursor

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
