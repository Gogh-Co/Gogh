#!/usr/bin/env bash

export PROFILE_NAME="Nightfly"

export COLOR_01="#1D3B53"           # Black (Host)
export COLOR_02="#FC514E"           # Red (Syntax string)
export COLOR_03="#A1CD5E"           # Green (Command)
export COLOR_04="#E3D18A"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#7FDBCA"           # Cyan (Prompt)
export COLOR_08="#A1AAB8"           # White

export COLOR_09="#7C8F8F"           # Bright Black
export COLOR_10="#FF5874"           # Bright Red (Command error)
export COLOR_11="#21C7A8"           # Bright Green (Exec)
export COLOR_12="#ECC48D"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#7FDBCA"           # Bright Cyan
export COLOR_16="#D6DEEB"           # Bright White

export BACKGROUND_COLOR="#011627"   # Background
export FOREGROUND_COLOR="#BDC1C6"   # Foreground (Text)

export CURSOR_COLOR="#9CA1AA" # Cursor

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
