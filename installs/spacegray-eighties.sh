#!/usr/bin/env bash

export PROFILE_NAME="Spacegray Eighties"

export COLOR_01="#15171C"           # Black (Host)
export COLOR_02="#EC5F67"           # Red (Syntax string)
export COLOR_03="#81A764"           # Green (Command)
export COLOR_04="#FEC254"           # Yellow (Command second)
export COLOR_05="#5486C0"           # Blue (Path)
export COLOR_06="#BF83C1"           # Magenta (Syntax var)
export COLOR_07="#57C2C1"           # Cyan (Prompt)
export COLOR_08="#EFECE7"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF6973"           # Bright Red (Command error)
export COLOR_11="#93D493"           # Bright Green (Exec)
export COLOR_12="#FFD256"           # Bright Yellow
export COLOR_13="#4D84D1"           # Bright Blue (Folder)
export COLOR_14="#FF55FF"           # Bright Magenta
export COLOR_15="#83E9E4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#BDBAAE"   # Foreground (Text)

export CURSOR_COLOR="#BDBAAE" # Cursor

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
