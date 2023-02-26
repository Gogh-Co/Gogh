#!/usr/bin/env bash

export PROFILE_NAME="Ibm3270"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#F01818"           # Red (Syntax string)
export COLOR_03="#24D830"           # Green (Command)
export COLOR_04="#F0D824"           # Yellow (Command second)
export COLOR_05="#7890F0"           # Blue (Path)
export COLOR_06="#F078D8"           # Magenta (Syntax var)
export COLOR_07="#54E4E4"           # Cyan (Prompt)
export COLOR_08="#A5A5A5"           # White

export COLOR_09="#888888"           # Bright Black
export COLOR_10="#EF8383"           # Bright Red (Command error)
export COLOR_11="#7ED684"           # Bright Green (Exec)
export COLOR_12="#EFE28B"           # Bright Yellow
export COLOR_13="#B3BFEF"           # Bright Blue (Folder)
export COLOR_14="#EFB3E3"           # Bright Magenta
export COLOR_15="#9CE2E2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FDFDFD"   # Foreground (Text)

export CURSOR_COLOR="#FDFDFD" # Cursor

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
