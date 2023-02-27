#!/usr/bin/env bash

export PROFILE_NAME="Mar"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B5407B"           # Red (Syntax string)
export COLOR_03="#7BB540"           # Green (Command)
export COLOR_04="#B57B40"           # Yellow (Command second)
export COLOR_05="#407BB5"           # Blue (Path)
export COLOR_06="#7B40B5"           # Magenta (Syntax var)
export COLOR_07="#40B57B"           # Cyan (Prompt)
export COLOR_08="#F8F8F8"           # White

export COLOR_09="#737373"           # Bright Black
export COLOR_10="#CD73A0"           # Bright Red (Command error)
export COLOR_11="#A0CD73"           # Bright Green (Exec)
export COLOR_12="#CDA073"           # Bright Yellow
export COLOR_13="#73A0CD"           # Bright Blue (Folder)
export COLOR_14="#A073CD"           # Bright Magenta
export COLOR_15="#73CDA0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

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
