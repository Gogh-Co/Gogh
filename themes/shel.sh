#!/usr/bin/env bash

export PROFILE_NAME="Shel"

export COLOR_01="#2c2423"           # Black (Host)
export COLOR_02="#ab2463"           # Red (Syntax string)
export COLOR_03="#6ca323"           # Green (Command)
export COLOR_04="#ab6423"           # Yellow (Command second)
export COLOR_05="#2c64a2"           # Blue (Path)
export COLOR_06="#6c24a2"           # Magenta (Syntax var)
export COLOR_07="#2ca363"           # Cyan (Prompt)
export COLOR_08="#918988"           # White

export COLOR_09="#918988"           # Bright Black
export COLOR_10="#f588b9"           # Bright Red (Command error)
export COLOR_11="#c2ee86"           # Bright Green (Exec)
export COLOR_12="#f5ba86"           # Bright Yellow
export COLOR_13="#8fbaec"           # Bright Blue (Folder)
export COLOR_14="#c288ec"           # Bright Magenta
export COLOR_15="#8feeb9"           # Bright Cyan
export COLOR_16="#f5eeec"           # Bright White

export BACKGROUND_COLOR="#2a201f"   # Background
export FOREGROUND_COLOR="#4882cd"   # Foreground (Text)

export CURSOR_COLOR="#4882cd" # Cursor

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
