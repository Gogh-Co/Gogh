#!/usr/bin/env bash

export PROFILE_NAME="Slate"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#e2a8bf"           # Red (Syntax string)
export COLOR_03="#81d778"           # Green (Command)
export COLOR_04="#c4c9c0"           # Yellow (Command second)
export COLOR_05="#264b49"           # Blue (Path)
export COLOR_06="#a481d3"           # Magenta (Syntax var)
export COLOR_07="#15ab9c"           # Cyan (Prompt)
export COLOR_08="#02c5e0"           # White

export COLOR_09="#ffffff"           # Bright Black
export COLOR_10="#ffcdd9"           # Bright Red (Command error)
export COLOR_11="#beffa8"           # Bright Green (Exec)
export COLOR_12="#d0ccca"           # Bright Yellow
export COLOR_13="#7ab0d2"           # Bright Blue (Folder)
export COLOR_14="#c5a7d9"           # Bright Magenta
export COLOR_15="#8cdfe0"           # Bright Cyan
export COLOR_16="#e0e0e0"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#35b1d2"   # Foreground (Text)

export CURSOR_COLOR="#35b1d2" # Cursor

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
