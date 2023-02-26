#!/usr/bin/env bash

export PROFILE_NAME="Toy Chest"

export COLOR_01="#2c3f58"           # Black (Host)
export COLOR_02="#be2d26"           # Red (Syntax string)
export COLOR_03="#1a9172"           # Green (Command)
export COLOR_04="#db8e27"           # Yellow (Command second)
export COLOR_05="#325d96"           # Blue (Path)
export COLOR_06="#8a5edc"           # Magenta (Syntax var)
export COLOR_07="#35a08f"           # Cyan (Prompt)
export COLOR_08="#23d183"           # White

export COLOR_09="#336889"           # Bright Black
export COLOR_10="#dd5944"           # Bright Red (Command error)
export COLOR_11="#31d07b"           # Bright Green (Exec)
export COLOR_12="#e7d84b"           # Bright Yellow
export COLOR_13="#34a6da"           # Bright Blue (Folder)
export COLOR_14="#ae6bdc"           # Bright Magenta
export COLOR_15="#42c3ae"           # Bright Cyan
export COLOR_16="#d5d5d5"           # Bright White

export BACKGROUND_COLOR="#24364b"   # Background
export FOREGROUND_COLOR="#31d07b"   # Foreground (Text)

export CURSOR_COLOR="#31d07b" # Cursor

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
