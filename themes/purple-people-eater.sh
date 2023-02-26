#!/usr/bin/env bash

export PROFILE_NAME="Purple People Eater"

export COLOR_01="#0D1117"           # Black (Host)
export COLOR_02="#E34C26"           # Red (Syntax string)
export COLOR_03="#238636"           # Green (Command)
export COLOR_04="#ED9A51"           # Yellow (Command second)
export COLOR_05="#A5D6FF"           # Blue (Path)
export COLOR_06="#6EB0E8"           # Magenta (Syntax var)
export COLOR_07="#C09AEB"           # Cyan (Prompt)
export COLOR_08="#C9D1D9"           # White

export COLOR_09="#0D1117"           # Bright Black
export COLOR_10="#FF7B72"           # Bright Red (Command error)
export COLOR_11="#3BAB4A"           # Bright Green (Exec)
export COLOR_12="#FFA657"           # Bright Yellow
export COLOR_13="#A5D6FF"           # Bright Blue (Folder)
export COLOR_14="#79C0FF"           # Bright Magenta
export COLOR_15="#B694DF"           # Bright Cyan
export COLOR_16="#C9D1D9"           # Bright White

export BACKGROUND_COLOR="#161B22"   # Background
export FOREGROUND_COLOR="#C9D1D9"   # Foreground (Text)

export CURSOR_COLOR="#C9D1D9" # Cursor

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
