#!/usr/bin/env bash

export PROFILE_NAME="Tokyo Night"

export COLOR_01="#414868"           # Black (Host)
export COLOR_02="#F7768E"           # Red (Syntax string)
export COLOR_03="#9ECE6A"           # Green (Command)
export COLOR_04="#E0AF68"           # Yellow (Command second)
export COLOR_05="#7AA2F7"           # Blue (Path)
export COLOR_06="#BB9AF7"           # Magenta (Syntax var)
export COLOR_07="#7DCFFF"           # Cyan (Prompt)
export COLOR_08="#A9B1D6"           # White

export COLOR_09="#414868"           # Bright Black
export COLOR_10="#F7768E"           # Bright Red (Command error)
export COLOR_11="#9ECE6A"           # Bright Green (Exec)
export COLOR_12="#E0AF68"           # Bright Yellow
export COLOR_13="#7AA2F7"           # Bright Blue (Folder)
export COLOR_14="#BB9AF7"           # Bright Magenta
export COLOR_15="#7DCFFF"           # Bright Cyan
export COLOR_16="#C0CAF5"           # Bright White

export BACKGROUND_COLOR="#1A1B26"   # Background
export FOREGROUND_COLOR="#C0CAF5"   # Foreground (Text)

export CURSOR_COLOR="#C0CAF5" # Cursor

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
