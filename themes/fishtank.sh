#!/usr/bin/env bash

export PROFILE_NAME="Fishtank"

export COLOR_01="#03073c"           # Black (Host)
export COLOR_02="#c6004a"           # Red (Syntax string)
export COLOR_03="#acf157"           # Green (Command)
export COLOR_04="#fecd5e"           # Yellow (Command second)
export COLOR_05="#525fb8"           # Blue (Path)
export COLOR_06="#986f82"           # Magenta (Syntax var)
export COLOR_07="#968763"           # Cyan (Prompt)
export COLOR_08="#ecf0fc"           # White

export COLOR_09="#6c5b30"           # Bright Black
export COLOR_10="#da4b8a"           # Bright Red (Command error)
export COLOR_11="#dbffa9"           # Bright Green (Exec)
export COLOR_12="#fee6a9"           # Bright Yellow
export COLOR_13="#b2befa"           # Bright Blue (Folder)
export COLOR_14="#fda5cd"           # Bright Magenta
export COLOR_15="#a5bd86"           # Bright Cyan
export COLOR_16="#f6ffec"           # Bright White

export BACKGROUND_COLOR="#232537"   # Background
export FOREGROUND_COLOR="#ecf0fe"   # Foreground (Text)

export CURSOR_COLOR="#ecf0fe" # Cursor

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
