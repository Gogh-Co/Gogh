#!/usr/bin/env bash

export PROFILE_NAME="Panda"

export COLOR_01="#1F1F20"           # Black (Host)
export COLOR_02="#FB055A"           # Red (Syntax string)
export COLOR_03="#26FFD4"           # Green (Command)
export COLOR_04="#FDAA5A"           # Yellow (Command second)
export COLOR_05="#5C9FFF"           # Blue (Path)
export COLOR_06="#FC59A6"           # Magenta (Syntax var)
export COLOR_07="#26FFD4"           # Cyan (Prompt)
export COLOR_08="#F0F0F0"           # White

export COLOR_09="#5C6370"           # Bright Black
export COLOR_10="#FB055A"           # Bright Red (Command error)
export COLOR_11="#26FFD4"           # Bright Green (Exec)
export COLOR_12="#FEBE7E"           # Bright Yellow
export COLOR_13="#55ADFF"           # Bright Blue (Folder)
export COLOR_14="#FD95D0"           # Bright Magenta
export COLOR_15="#26FFD4"           # Bright Cyan
export COLOR_16="#F0F0F0"           # Bright White

export BACKGROUND_COLOR="#1D1E20"   # Background
export FOREGROUND_COLOR="#F0F0F0"   # Foreground (Text)

export CURSOR_COLOR="#F0F0F0" # Cursor

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
