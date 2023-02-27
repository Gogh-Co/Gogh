#!/usr/bin/env bash

export PROFILE_NAME="Fishtank"

export COLOR_01="#03073C"           # Black (Host)
export COLOR_02="#C6004A"           # Red (Syntax string)
export COLOR_03="#ACF157"           # Green (Command)
export COLOR_04="#FECD5E"           # Yellow (Command second)
export COLOR_05="#525FB8"           # Blue (Path)
export COLOR_06="#986F82"           # Magenta (Syntax var)
export COLOR_07="#968763"           # Cyan (Prompt)
export COLOR_08="#ECF0FC"           # White

export COLOR_09="#6C5B30"           # Bright Black
export COLOR_10="#DA4B8A"           # Bright Red (Command error)
export COLOR_11="#DBFFA9"           # Bright Green (Exec)
export COLOR_12="#FEE6A9"           # Bright Yellow
export COLOR_13="#B2BEFA"           # Bright Blue (Folder)
export COLOR_14="#FDA5CD"           # Bright Magenta
export COLOR_15="#A5BD86"           # Bright Cyan
export COLOR_16="#F6FFEC"           # Bright White

export BACKGROUND_COLOR="#232537"   # Background
export FOREGROUND_COLOR="#ECF0FE"   # Foreground (Text)

export CURSOR_COLOR="#ECF0FE" # Cursor

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
