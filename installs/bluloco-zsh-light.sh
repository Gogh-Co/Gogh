#!/usr/bin/env bash

export PROFILE_NAME="Bluloco Zsh Light"

export COLOR_01="#E4E5F1"           # Black (Host)
export COLOR_02="#D52753"           # Red (Syntax string)
export COLOR_03="#23974A"           # Green (Command)
export COLOR_04="#DF631C"           # Yellow (Command second)
export COLOR_05="#275FE4"           # Blue (Path)
export COLOR_06="#823FF1"           # Magenta (Syntax var)
export COLOR_07="#27618D"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#5794DE"           # Bright Black
export COLOR_10="#FF6480"           # Bright Red (Command error)
export COLOR_11="#3CBC66"           # Bright Green (Exec)
export COLOR_12="#C5A332"           # Bright Yellow
export COLOR_13="#0099E1"           # Bright Blue (Folder)
export COLOR_14="#CE33C0"           # Bright Magenta
export COLOR_15="#6D93BB"           # Bright Cyan
export COLOR_16="#26272D"           # Bright White

export BACKGROUND_COLOR="#F9F9F9"   # Background
export FOREGROUND_COLOR="#383A42"   # Foreground (Text)

export CURSOR_COLOR="#383A42" # Cursor

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
