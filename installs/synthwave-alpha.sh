#!/usr/bin/env bash

export PROFILE_NAME="Synthwave Alpha"

export COLOR_01="#241B30"           # Black (Host)
export COLOR_02="#9A0048"           # Red (Syntax string)
export COLOR_03="#00986C"           # Green (Command)
export COLOR_04="#ADAD3E"           # Yellow (Command second)
export COLOR_05="#6E29AD"           # Blue (Path)
export COLOR_06="#B300AD"           # Magenta (Syntax var)
export COLOR_07="#00B0B1"           # Cyan (Prompt)
export COLOR_08="#B9B1BC"           # White

export COLOR_09="#7F7094"           # Bright Black
export COLOR_10="#E60A70"           # Bright Red (Command error)
export COLOR_11="#0AE4A4"           # Bright Green (Exec)
export COLOR_12="#F9F972"           # Bright Yellow
export COLOR_13="#AA54F9"           # Bright Blue (Folder)
export COLOR_14="#FF00F6"           # Bright Magenta
export COLOR_15="#00FBFD"           # Bright Cyan
export COLOR_16="#F2F2E3"           # Bright White

export BACKGROUND_COLOR="#241B30"   # Background
export FOREGROUND_COLOR="#F2F2E3"   # Foreground (Text)

export CURSOR_COLOR="#F2F2E3" # Cursor

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
