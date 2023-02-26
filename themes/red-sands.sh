#!/usr/bin/env bash

export PROFILE_NAME="Red Sands"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF3F00"           # Red (Syntax string)
export COLOR_03="#00BB00"           # Green (Command)
export COLOR_04="#E7B000"           # Yellow (Command second)
export COLOR_05="#0072FF"           # Blue (Path)
export COLOR_06="#BB00BB"           # Magenta (Syntax var)
export COLOR_07="#00BBBB"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#BB0000"           # Bright Red (Command error)
export COLOR_11="#00BB00"           # Bright Green (Exec)
export COLOR_12="#E7B000"           # Bright Yellow
export COLOR_13="#0072AE"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#55FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#7A251E"   # Background
export FOREGROUND_COLOR="#D7C9A7"   # Foreground (Text)

export CURSOR_COLOR="#D7C9A7" # Cursor

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
