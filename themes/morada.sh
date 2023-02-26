#!/usr/bin/env bash

export PROFILE_NAME="Morada"

export COLOR_01="#040404"           # Black (Host)
export COLOR_02="#0f49c4"           # Red (Syntax string)
export COLOR_03="#48b117"           # Green (Command)
export COLOR_04="#e87324"           # Yellow (Command second)
export COLOR_05="#bc0116"           # Blue (Path)
export COLOR_06="#665b93"           # Magenta (Syntax var)
export COLOR_07="#70a699"           # Cyan (Prompt)
export COLOR_08="#f5dcbe"           # White

export COLOR_09="#4f7cbf"           # Bright Black
export COLOR_10="#1c96c7"           # Bright Red (Command error)
export COLOR_11="#3bff6f"           # Bright Green (Exec)
export COLOR_12="#efc31c"           # Bright Yellow
export COLOR_13="#fb605b"           # Bright Blue (Folder)
export COLOR_14="#975b5a"           # Bright Magenta
export COLOR_15="#1eff8e"           # Bright Cyan
export COLOR_16="#f6f5fb"           # Bright White

export BACKGROUND_COLOR="#211f46"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
