#!/usr/bin/env bash

export PROFILE_NAME="Srcery"

export COLOR_01="#1c1b19"           # Black (Host)
export COLOR_02="#ef2f27"           # Red (Syntax string)
export COLOR_03="#519f50"           # Green (Command)
export COLOR_04="#fbb829"           # Yellow (Command second)
export COLOR_05="#2c78bf"           # Blue (Path)
export COLOR_06="#e02c6d"           # Magenta (Syntax var)
export COLOR_07="#0aaeb3"           # Cyan (Prompt)
export COLOR_08="#baa67f"           # White

export COLOR_09="#918175"           # Bright Black
export COLOR_10="#f75341"           # Bright Red (Command error)
export COLOR_11="#98bc37"           # Bright Green (Exec)
export COLOR_12="#fed06e"           # Bright Yellow
export COLOR_13="#68a8e4"           # Bright Blue (Folder)
export COLOR_14="#ff5c8f"           # Bright Magenta
export COLOR_15="#2be4d0"           # Bright Cyan
export COLOR_16="#fce8c3"           # Bright White

export BACKGROUND_COLOR="#1c1b19"   # Background
export FOREGROUND_COLOR="#fce8c3"   # Foreground (Text)

export CURSOR_COLOR="#fbb829" # Cursor

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
