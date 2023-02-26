#!/usr/bin/env bash

export PROFILE_NAME="Afterglow"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#A53C23"           # Red (Syntax string)
export COLOR_03="#7B9246"           # Green (Command)
export COLOR_04="#D3A04D"           # Yellow (Command second)
export COLOR_05="#6C99BB"           # Blue (Path)
export COLOR_06="#9F4E85"           # Magenta (Syntax var)
export COLOR_07="#7DD6CF"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#A53C23"           # Bright Red (Command error)
export COLOR_11="#7B9246"           # Bright Green (Exec)
export COLOR_12="#D3A04D"           # Bright Yellow
export COLOR_13="#547C99"           # Bright Blue (Folder)
export COLOR_14="#9F4E85"           # Bright Magenta
export COLOR_15="#7DD6CF"           # Bright Cyan
export COLOR_16="#F5F5F5"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
