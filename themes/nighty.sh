#!/usr/bin/env bash

export PROFILE_NAME="Nighty"

export COLOR_01="#373D48"           # Black (Host)
export COLOR_02="#9B3E46"           # Red (Syntax string)
export COLOR_03="#095B32"           # Green (Command)
export COLOR_04="#808020"           # Yellow (Command second)
export COLOR_05="#1D3E6F"           # Blue (Path)
export COLOR_06="#823065"           # Magenta (Syntax var)
export COLOR_07="#3A7458"           # Cyan (Prompt)
export COLOR_08="#828282"           # White

export COLOR_09="#5C6370"           # Bright Black
export COLOR_10="#D0555F"           # Bright Red (Command error)
export COLOR_11="#119955"           # Bright Green (Exec)
export COLOR_12="#DFE048"           # Bright Yellow
export COLOR_13="#4674B8"           # Bright Blue (Folder)
export COLOR_14="#ED86C9"           # Bright Magenta
export COLOR_15="#70D2A4"           # Bright Cyan
export COLOR_16="#DFDFDF"           # Bright White

export BACKGROUND_COLOR="#2F2F2F"   # Background
export FOREGROUND_COLOR="#DFDFDF"   # Foreground (Text)

export CURSOR_COLOR="#DFDFDF" # Cursor

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
