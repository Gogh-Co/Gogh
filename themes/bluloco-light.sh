#!/usr/bin/env bash

export PROFILE_NAME="Bluloco Light"

export COLOR_01="#d5d6dd"           # Black (Host)
export COLOR_02="#d52753"           # Red (Syntax string)
export COLOR_03="#23974a"           # Green (Command)
export COLOR_04="#df631c"           # Yellow (Command second)
export COLOR_05="#275fe4"           # Blue (Path)
export COLOR_06="#823ff1"           # Magenta (Syntax var)
export COLOR_07="#27618d"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#e4e5ed"           # Bright Black
export COLOR_10="#ff6480"           # Bright Red (Command error)
export COLOR_11="#3cbc66"           # Bright Green (Exec)
export COLOR_12="#c5a332"           # Bright Yellow
export COLOR_13="#0099e1"           # Bright Blue (Folder)
export COLOR_14="#ce33c0"           # Bright Magenta
export COLOR_15="#6d93bb"           # Bright Cyan
export COLOR_16="#26272d"           # Bright White

export BACKGROUND_COLOR="#f9f9f9"   # Background
export FOREGROUND_COLOR="#383a42"   # Foreground (Text)

export CURSOR_COLOR="#383a42" # Cursor

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
