#!/usr/bin/env bash

export PROFILE_NAME="Monokai Dark"

export COLOR_01="#75715e"           # Black (Host)
export COLOR_02="#f92672"           # Red (Syntax string)
export COLOR_03="#a6e22e"           # Green (Command)
export COLOR_04="#f4bf75"           # Yellow (Command second)
export COLOR_05="#66d9ef"           # Blue (Path)
export COLOR_06="#ae81ff"           # Magenta (Syntax var)
export COLOR_07="#2AA198"           # Cyan (Prompt)
export COLOR_08="#f9f8f5"           # White

export COLOR_09="#272822"           # Bright Black
export COLOR_10="#f92672"           # Bright Red (Command error)
export COLOR_11="#a6e22e"           # Bright Green (Exec)
export COLOR_12="#f4bf75"           # Bright Yellow
export COLOR_13="#66d9ef"           # Bright Blue (Folder)
export COLOR_14="#ae81ff"           # Bright Magenta
export COLOR_15="#2AA198"           # Bright Cyan
export COLOR_16="#f8f8f2"           # Bright White

export BACKGROUND_COLOR="#272822"   # Background
export FOREGROUND_COLOR="#f8f8f2"   # Foreground (Text)

export CURSOR_COLOR="#f8f8f2" # Cursor

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
