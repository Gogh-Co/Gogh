#!/usr/bin/env bash

export PROFILE_NAME="Espresso Libre"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#1A921C"           # Green (Command)
export COLOR_04="#F0E53A"           # Yellow (Command second)
export COLOR_05="#0066FF"           # Blue (Path)
export COLOR_06="#C5656B"           # Magenta (Syntax var)
export COLOR_07="#06989A"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#EF2929"           # Bright Red (Command error)
export COLOR_11="#9AFF87"           # Bright Green (Exec)
export COLOR_12="#FFFB5C"           # Bright Yellow
export COLOR_13="#43A8ED"           # Bright Blue (Folder)
export COLOR_14="#FF818A"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#2A211C"   # Background
export FOREGROUND_COLOR="#B8A898"   # Foreground (Text)

export CURSOR_COLOR="#B8A898" # Cursor

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
