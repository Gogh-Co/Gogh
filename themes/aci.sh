#!/usr/bin/env bash

export PROFILE_NAME="Aci"

export COLOR_01="#363636"           # Black (Host)
export COLOR_02="#ff0883"           # Red (Syntax string)
export COLOR_03="#83ff08"           # Green (Command)
export COLOR_04="#ff8308"           # Yellow (Command second)
export COLOR_05="#0883ff"           # Blue (Path)
export COLOR_06="#8308ff"           # Magenta (Syntax var)
export COLOR_07="#08ff83"           # Cyan (Prompt)
export COLOR_08="#b6b6b6"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#ff1e8e"           # Bright Red (Command error)
export COLOR_11="#8eff1e"           # Bright Green (Exec)
export COLOR_12="#ff8e1e"           # Bright Yellow
export COLOR_13="#1e8eff"           # Bright Blue (Folder)
export COLOR_14="#8e1eff"           # Bright Magenta
export COLOR_15="#1eff8e"           # Bright Cyan
export COLOR_16="#c2c2c2"           # Bright White

export BACKGROUND_COLOR="#0d1926"   # Background
export FOREGROUND_COLOR="#b4e1fd"   # Foreground (Text)

export CURSOR_COLOR="#b4e1fd" # Cursor

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
