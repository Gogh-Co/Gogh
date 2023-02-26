#!/usr/bin/env bash

export PROFILE_NAME="Alien Blood"

export COLOR_01="#112616"           # Black (Host)
export COLOR_02="#7f2b27"           # Red (Syntax string)
export COLOR_03="#2f7e25"           # Green (Command)
export COLOR_04="#717f24"           # Yellow (Command second)
export COLOR_05="#2f6a7f"           # Blue (Path)
export COLOR_06="#47587f"           # Magenta (Syntax var)
export COLOR_07="#327f77"           # Cyan (Prompt)
export COLOR_08="#647d75"           # White

export COLOR_09="#3c4812"           # Bright Black
export COLOR_10="#e08009"           # Bright Red (Command error)
export COLOR_11="#18e000"           # Bright Green (Exec)
export COLOR_12="#bde000"           # Bright Yellow
export COLOR_13="#00aae0"           # Bright Blue (Folder)
export COLOR_14="#0058e0"           # Bright Magenta
export COLOR_15="#00e0c4"           # Bright Cyan
export COLOR_16="#73fa91"           # Bright White

export BACKGROUND_COLOR="#0f1610"   # Background
export FOREGROUND_COLOR="#637d75"   # Foreground (Text)

export CURSOR_COLOR="#637d75" # Cursor

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
