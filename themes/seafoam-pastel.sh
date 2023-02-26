#!/usr/bin/env bash

export PROFILE_NAME="Seafoam Pastel"

export COLOR_01="#757575"           # Black (Host)
export COLOR_02="#825D4D"           # Red (Syntax string)
export COLOR_03="#728C62"           # Green (Command)
export COLOR_04="#ADA16D"           # Yellow (Command second)
export COLOR_05="#4D7B82"           # Blue (Path)
export COLOR_06="#8A7267"           # Magenta (Syntax var)
export COLOR_07="#729494"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#8A8A8A"           # Bright Black
export COLOR_10="#CF937A"           # Bright Red (Command error)
export COLOR_11="#98D9AA"           # Bright Green (Exec)
export COLOR_12="#FAE79D"           # Bright Yellow
export COLOR_13="#7AC3CF"           # Bright Blue (Folder)
export COLOR_14="#D6B2A1"           # Bright Magenta
export COLOR_15="#ADE0E0"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#243435"   # Background
export FOREGROUND_COLOR="#D4E7D4"   # Foreground (Text)

export CURSOR_COLOR="#D4E7D4" # Cursor

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
