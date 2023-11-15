#!/usr/bin/env bash

export PROFILE_NAME="Website"

export COLOR_01="#183c44"           # Black (Host)
export COLOR_02="#da4949"           # Red (Syntax string)
export COLOR_03="#bcca15"           # Green (Command)
export COLOR_04="#ffb02e"           # Yellow (Command second)
export COLOR_05="#35a6e6"           # Blue (Path)
export COLOR_06="#d343a2"           # Magenta (Syntax var)
export COLOR_07="#38c995"           # Cyan (Prompt)
export COLOR_08="#ffe8c1"           # White

export COLOR_09="#235662"           # Bright Black
export COLOR_10="#ff5757"           # Bright Red (Command error)
export COLOR_11="#ecff14"           # Bright Green (Exec)
export COLOR_12="#ffd694"           # Bright Yellow
export COLOR_13="#4cbfff"           # Bright Blue (Folder)
export COLOR_14="#ff4cc2"           # Bright Magenta
export COLOR_15="#35ffb6"           # Bright Cyan
export COLOR_16="#ffd48f"           # Bright White

export BACKGROUND_COLOR="#132f35"   # Background
export FOREGROUND_COLOR="#d1b890"   # Foreground (Text)

export CURSOR_COLOR="#d1b890" # Cursor

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
