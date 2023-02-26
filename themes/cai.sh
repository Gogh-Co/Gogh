#!/usr/bin/env bash

export PROFILE_NAME="Cai"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#ca274d"           # Red (Syntax string)
export COLOR_03="#4dca27"           # Green (Command)
export COLOR_04="#caa427"           # Yellow (Command second)
export COLOR_05="#274dca"           # Blue (Path)
export COLOR_06="#a427ca"           # Magenta (Syntax var)
export COLOR_07="#27caa4"           # Cyan (Prompt)
export COLOR_08="#808080"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#e98da3"           # Bright Red (Command error)
export COLOR_11="#a3e98d"           # Bright Green (Exec)
export COLOR_12="#e9d48d"           # Bright Yellow
export COLOR_13="#8da3e9"           # Bright Blue (Folder)
export COLOR_14="#d48de9"           # Bright Magenta
export COLOR_15="#8de9d4"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#09111a"   # Background
export FOREGROUND_COLOR="#d9e6f2"   # Foreground (Text)

export CURSOR_COLOR="#d9e6f2" # Cursor

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
