#!/usr/bin/env bash

export PROFILE_NAME="Atom"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FD5FF1"           # Red (Syntax string)
export COLOR_03="#87C38A"           # Green (Command)
export COLOR_04="#FFD7B1"           # Yellow (Command second)
export COLOR_05="#85BEFD"           # Blue (Path)
export COLOR_06="#B9B6FC"           # Magenta (Syntax var)
export COLOR_07="#85BEFD"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FD5FF1"           # Bright Red (Command error)
export COLOR_11="#94FA36"           # Bright Green (Exec)
export COLOR_12="#F5FFA8"           # Bright Yellow
export COLOR_13="#96CBFE"           # Bright Blue (Folder)
export COLOR_14="#B9B6FC"           # Bright Magenta
export COLOR_15="#85BEFD"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#161719"   # Background
export FOREGROUND_COLOR="#C5C8C6"   # Foreground (Text)

export CURSOR_COLOR="#C5C8C6" # Cursor

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
