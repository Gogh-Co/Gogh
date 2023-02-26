#!/usr/bin/env bash

export PROFILE_NAME="Clone Of Ubuntu"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#4E9A06"           # Green (Command)
export COLOR_04="#C4A000"           # Yellow (Command second)
export COLOR_05="#3465A4"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#06989A"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#EF2929"           # Bright Red (Command error)
export COLOR_11="#8AE234"           # Bright Green (Exec)
export COLOR_12="#FCE94F"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#AD7FA8"           # Bright Magenta
export COLOR_15="#34E2E2"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#300A24"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
