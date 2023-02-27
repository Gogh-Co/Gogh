#!/usr/bin/env bash

export PROFILE_NAME="Papercolor Dark"

export COLOR_01="#1C1C1C"           # Black (Host)
export COLOR_02="#AF005F"           # Red (Syntax string)
export COLOR_03="#5FAF00"           # Green (Command)
export COLOR_04="#D7AF5F"           # Yellow (Command second)
export COLOR_05="#5FAFD7"           # Blue (Path)
export COLOR_06="#808080"           # Magenta (Syntax var)
export COLOR_07="#D7875F"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#5FAF5F"           # Bright Red (Command error)
export COLOR_11="#AFD700"           # Bright Green (Exec)
export COLOR_12="#AF87D7"           # Bright Yellow
export COLOR_13="#FFAF00"           # Bright Blue (Folder)
export COLOR_14="#FF5FAF"           # Bright Magenta
export COLOR_15="#00AFAF"           # Bright Cyan
export COLOR_16="#5F8787"           # Bright White

export BACKGROUND_COLOR="#1C1C1C"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
