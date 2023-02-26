#!/usr/bin/env bash

export PROFILE_NAME="Srcery"

export COLOR_01="#1C1B19"           # Black (Host)
export COLOR_02="#EF2F27"           # Red (Syntax string)
export COLOR_03="#519F50"           # Green (Command)
export COLOR_04="#FBB829"           # Yellow (Command second)
export COLOR_05="#2C78BF"           # Blue (Path)
export COLOR_06="#E02C6D"           # Magenta (Syntax var)
export COLOR_07="#0AAEB3"           # Cyan (Prompt)
export COLOR_08="#BAA67F"           # White

export COLOR_09="#918175"           # Bright Black
export COLOR_10="#F75341"           # Bright Red (Command error)
export COLOR_11="#98BC37"           # Bright Green (Exec)
export COLOR_12="#FED06E"           # Bright Yellow
export COLOR_13="#68A8E4"           # Bright Blue (Folder)
export COLOR_14="#FF5C8F"           # Bright Magenta
export COLOR_15="#2BE4D0"           # Bright Cyan
export COLOR_16="#FCE8C3"           # Bright White

export BACKGROUND_COLOR="#1C1B19"   # Background
export FOREGROUND_COLOR="#FCE8C3"   # Foreground (Text)

export CURSOR_COLOR="#FBB829" # Cursor

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
