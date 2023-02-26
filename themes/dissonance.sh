#!/usr/bin/env bash

export PROFILE_NAME="Dissonance"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#dc322f"           # Red (Syntax string)
export COLOR_03="#56db3a"           # Green (Command)
export COLOR_04="#ff8400"           # Yellow (Command second)
export COLOR_05="#0084d4"           # Blue (Path)
export COLOR_06="#b729d9"           # Magenta (Syntax var)
export COLOR_07="#ccccff"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#d6dbe5"           # Bright Black
export COLOR_10="#dc322f"           # Bright Red (Command error)
export COLOR_11="#56db3a"           # Bright Green (Exec)
export COLOR_12="#ff8400"           # Bright Yellow
export COLOR_13="#0084d4"           # Bright Blue (Folder)
export COLOR_14="#b729d9"           # Bright Magenta
export COLOR_15="#ccccff"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#dc322f" # Cursor

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
