#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro"

export COLOR_01="#363537"           # Black (Host)
export COLOR_02="#FF6188"           # Red (Syntax string)
export COLOR_03="#A9DC76"           # Green (Command)
export COLOR_04="#FFD866"           # Yellow (Command second)
export COLOR_05="#FC9867"           # Blue (Path)
export COLOR_06="#AB9DF2"           # Magenta (Syntax var)
export COLOR_07="#78DCE8"           # Cyan (Prompt)
export COLOR_08="#FDF9F3"           # White

export COLOR_09="#908E8F"           # Bright Black
export COLOR_10="#FF6188"           # Bright Red (Command error)
export COLOR_11="#A9DC76"           # Bright Green (Exec)
export COLOR_12="#FFD866"           # Bright Yellow
export COLOR_13="#FC9867"           # Bright Blue (Folder)
export COLOR_14="#AB9DF2"           # Bright Magenta
export COLOR_15="#78DCE8"           # Bright Cyan
export COLOR_16="#FDF9F3"           # Bright White

export BACKGROUND_COLOR="#363537"   # Background
export FOREGROUND_COLOR="#FDF9F3"   # Foreground (Text)

export CURSOR_COLOR="#FDF9F3" # Cursor

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
