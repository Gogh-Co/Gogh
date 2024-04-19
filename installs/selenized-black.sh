#!/usr/bin/env bash

export PROFILE_NAME="Selenized Black"

export COLOR_01="#252525"           # Black (Host)
export COLOR_02="#ed4a46"           # Red (Syntax string)
export COLOR_03="#70b433"           # Green (Command)
export COLOR_04="#dbb32d"           # Yellow (Command second)
export COLOR_05="#368aeb"           # Blue (Path)
export COLOR_06="#eb6eb7"           # Magenta (Syntax var)
export COLOR_07="#3fc5b7"           # Cyan (Prompt)
export COLOR_08="#777777"           # White

export COLOR_09="#3b3b3b"           # Bright Black
export COLOR_10="#ff5e56"           # Bright Red (Command error)
export COLOR_11="#83c746"           # Bright Green (Exec)
export COLOR_12="#efc541"           # Bright Yellow
export COLOR_13="#4f9cfe"           # Bright Blue (Folder)
export COLOR_14="#ff81ca"           # Bright Magenta
export COLOR_15="#56d8c9"           # Bright Cyan
export COLOR_16="#dedede"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#b9b9b9"   # Foreground (Text)

export CURSOR_COLOR="#dedede" # Cursor

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
