#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Material"

export COLOR_01="#3C3836"           # Black (Host)
export COLOR_02="#EA6962"           # Red (Syntax string)
export COLOR_03="#A9B665"           # Green (Command)
export COLOR_04="#D8A657"           # Yellow (Command second)
export COLOR_05="#7DAEA3"           # Blue (Path)
export COLOR_06="#D3869B"           # Magenta (Syntax var)
export COLOR_07="#89B482"           # Cyan (Prompt)
export COLOR_08="#D4BE98"           # White

export COLOR_09="#3C3836"           # Bright Black
export COLOR_10="#EA6962"           # Bright Red (Command error)
export COLOR_11="#A9B665"           # Bright Green (Exec)
export COLOR_12="#D8A657"           # Bright Yellow
export COLOR_13="#7DAEA3"           # Bright Blue (Folder)
export COLOR_14="#D3869B"           # Bright Magenta
export COLOR_15="#89B482"           # Bright Cyan
export COLOR_16="#D4BE98"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#D4BE98"   # Foreground (Text)

export CURSOR_COLOR="#D4BE98" # Cursor

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
