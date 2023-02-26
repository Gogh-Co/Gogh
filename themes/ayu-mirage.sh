#!/usr/bin/env bash

export PROFILE_NAME="Ayu Mirage"

export COLOR_01="#1F2430"           # Black (Host)
export COLOR_02="#FF3333"           # Red (Syntax string)
export COLOR_03="#BAE67E"           # Green (Command)
export COLOR_04="#FFA759"           # Yellow (Command second)
export COLOR_05="#73D0FF"           # Blue (Path)
export COLOR_06="#D4BFFF"           # Magenta (Syntax var)
export COLOR_07="#95E6CB"           # Cyan (Prompt)
export COLOR_08="#CBCCC6"           # White

export COLOR_09="#707A8C"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#BAE67E"           # Bright Green (Exec)
export COLOR_12="#FFA759"           # Bright Yellow
export COLOR_13="#73D0FF"           # Bright Blue (Folder)
export COLOR_14="#D4BFFF"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#CBCCC6"           # Bright White

export BACKGROUND_COLOR="#1F2430"   # Background
export FOREGROUND_COLOR="#CBCCC6"   # Foreground (Text)

export CURSOR_COLOR="#FFCC66" # Cursor

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
