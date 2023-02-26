#!/usr/bin/env bash

export PROFILE_NAME="Spacedust"

export COLOR_01="#6E5346"           # Black (Host)
export COLOR_02="#E35B00"           # Red (Syntax string)
export COLOR_03="#5CAB96"           # Green (Command)
export COLOR_04="#E3CD7B"           # Yellow (Command second)
export COLOR_05="#0F548B"           # Blue (Path)
export COLOR_06="#E35B00"           # Magenta (Syntax var)
export COLOR_07="#06AFC7"           # Cyan (Prompt)
export COLOR_08="#F0F1CE"           # White

export COLOR_09="#684C31"           # Bright Black
export COLOR_10="#FF8A3A"           # Bright Red (Command error)
export COLOR_11="#AECAB8"           # Bright Green (Exec)
export COLOR_12="#FFC878"           # Bright Yellow
export COLOR_13="#67A0CE"           # Bright Blue (Folder)
export COLOR_14="#FF8A3A"           # Bright Magenta
export COLOR_15="#83A7B4"           # Bright Cyan
export COLOR_16="#FEFFF1"           # Bright White

export BACKGROUND_COLOR="#0A1E24"   # Background
export FOREGROUND_COLOR="#ECF0C1"   # Foreground (Text)

export CURSOR_COLOR="#ECF0C1" # Cursor

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
