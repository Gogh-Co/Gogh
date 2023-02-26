#!/usr/bin/env bash

export PROFILE_NAME="Papercolor Light"

export COLOR_01="#EEEEEE"           # Black (Host)
export COLOR_02="#AF0000"           # Red (Syntax string)
export COLOR_03="#008700"           # Green (Command)
export COLOR_04="#5F8700"           # Yellow (Command second)
export COLOR_05="#0087AF"           # Blue (Path)
export COLOR_06="#878787"           # Magenta (Syntax var)
export COLOR_07="#005F87"           # Cyan (Prompt)
export COLOR_08="#444444"           # White

export COLOR_09="#BCBCBC"           # Bright Black
export COLOR_10="#D70000"           # Bright Red (Command error)
export COLOR_11="#D70087"           # Bright Green (Exec)
export COLOR_12="#8700AF"           # Bright Yellow
export COLOR_13="#D75F00"           # Bright Blue (Folder)
export COLOR_14="#D75F00"           # Bright Magenta
export COLOR_15="#005FAF"           # Bright Cyan
export COLOR_16="#005F87"           # Bright White

export BACKGROUND_COLOR="#EEEEEE"   # Background
export FOREGROUND_COLOR="#444444"   # Foreground (Text)

export CURSOR_COLOR="#444444" # Cursor

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
