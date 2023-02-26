#!/usr/bin/env bash

export PROFILE_NAME="Kibble"

export COLOR_01="#4D4D4D"           # Black (Host)
export COLOR_02="#C70031"           # Red (Syntax string)
export COLOR_03="#29CF13"           # Green (Command)
export COLOR_04="#D8E30E"           # Yellow (Command second)
export COLOR_05="#3449D1"           # Blue (Path)
export COLOR_06="#8400FF"           # Magenta (Syntax var)
export COLOR_07="#0798AB"           # Cyan (Prompt)
export COLOR_08="#E2D1E3"           # White

export COLOR_09="#5A5A5A"           # Bright Black
export COLOR_10="#F01578"           # Bright Red (Command error)
export COLOR_11="#6CE05C"           # Bright Green (Exec)
export COLOR_12="#F3F79E"           # Bright Yellow
export COLOR_13="#97A4F7"           # Bright Blue (Folder)
export COLOR_14="#C495F0"           # Bright Magenta
export COLOR_15="#68F2E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E100A"   # Background
export FOREGROUND_COLOR="#F7F7F7"   # Foreground (Text)

export CURSOR_COLOR="#F7F7F7" # Cursor

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
