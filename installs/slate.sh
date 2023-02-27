#!/usr/bin/env bash

export PROFILE_NAME="Slate"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#E2A8BF"           # Red (Syntax string)
export COLOR_03="#81D778"           # Green (Command)
export COLOR_04="#C4C9C0"           # Yellow (Command second)
export COLOR_05="#264B49"           # Blue (Path)
export COLOR_06="#A481D3"           # Magenta (Syntax var)
export COLOR_07="#15AB9C"           # Cyan (Prompt)
export COLOR_08="#02C5E0"           # White

export COLOR_09="#FFFFFF"           # Bright Black
export COLOR_10="#FFCDD9"           # Bright Red (Command error)
export COLOR_11="#BEFFA8"           # Bright Green (Exec)
export COLOR_12="#D0CCCA"           # Bright Yellow
export COLOR_13="#7AB0D2"           # Bright Blue (Folder)
export COLOR_14="#C5A7D9"           # Bright Magenta
export COLOR_15="#8CDFE0"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#35B1D2"   # Foreground (Text)

export CURSOR_COLOR="#35B1D2" # Cursor

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
