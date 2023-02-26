#!/usr/bin/env bash

export PROFILE_NAME="Mono Yellow"

export COLOR_01="#403500"           # Black (Host)
export COLOR_02="#FFD300"           # Red (Syntax string)
export COLOR_03="#FFD300"           # Green (Command)
export COLOR_04="#FFD300"           # Yellow (Command second)
export COLOR_05="#FFD300"           # Blue (Path)
export COLOR_06="#FFD300"           # Magenta (Syntax var)
export COLOR_07="#FFD300"           # Cyan (Prompt)
export COLOR_08="#FFD300"           # White

export COLOR_09="#FFD300"           # Bright Black
export COLOR_10="#FFD300"           # Bright Red (Command error)
export COLOR_11="#FFD300"           # Bright Green (Exec)
export COLOR_12="#FFD300"           # Bright Yellow
export COLOR_13="#FFD300"           # Bright Blue (Folder)
export COLOR_14="#FFD300"           # Bright Magenta
export COLOR_15="#FFD300"           # Bright Cyan
export COLOR_16="#FFD300"           # Bright White

export BACKGROUND_COLOR="#2B2400"   # Background
export FOREGROUND_COLOR="#FFD300"   # Foreground (Text)

export CURSOR_COLOR="#FFD300" # Cursor

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
