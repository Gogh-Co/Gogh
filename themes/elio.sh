#!/usr/bin/env bash

export PROFILE_NAME="Elio"

export COLOR_01="#303030"           # Black (Host)
export COLOR_02="#E1321A"           # Red (Syntax string)
export COLOR_03="#6AB017"           # Green (Command)
export COLOR_04="#FFC005"           # Yellow (Command second)
export COLOR_05="#729FCF"           # Blue (Path)
export COLOR_06="#EC0048"           # Magenta (Syntax var)
export COLOR_07="#2AA7E7"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#5D5D5D"           # Bright Black
export COLOR_10="#FF361E"           # Bright Red (Command error)
export COLOR_11="#7BC91F"           # Bright Green (Exec)
export COLOR_12="#FFD00A"           # Bright Yellow
export COLOR_13="#0071FF"           # Bright Blue (Folder)
export COLOR_14="#FF1D62"           # Bright Magenta
export COLOR_15="#4BB8FD"           # Bright Cyan
export COLOR_16="#A020F0"           # Bright White

export BACKGROUND_COLOR="#041A3B"   # Background
export FOREGROUND_COLOR="#F2F2F2"   # Foreground (Text)

export CURSOR_COLOR="#F2F2F2" # Cursor

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
