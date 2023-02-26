#!/usr/bin/env bash

export PROFILE_NAME="Earthsong"

export COLOR_01="#121418"           # Black (Host)
export COLOR_02="#c94234"           # Red (Syntax string)
export COLOR_03="#85c54c"           # Green (Command)
export COLOR_04="#f5ae2e"           # Yellow (Command second)
export COLOR_05="#1398b9"           # Blue (Path)
export COLOR_06="#d0633d"           # Magenta (Syntax var)
export COLOR_07="#509552"           # Cyan (Prompt)
export COLOR_08="#e5c6aa"           # White

export COLOR_09="#675f54"           # Bright Black
export COLOR_10="#ff645a"           # Bright Red (Command error)
export COLOR_11="#98e036"           # Bright Green (Exec)
export COLOR_12="#e0d561"           # Bright Yellow
export COLOR_13="#5fdaff"           # Bright Blue (Folder)
export COLOR_14="#ff9269"           # Bright Magenta
export COLOR_15="#84f088"           # Bright Cyan
export COLOR_16="#f6f7ec"           # Bright White

export BACKGROUND_COLOR="#292520"   # Background
export FOREGROUND_COLOR="#e5c7a9"   # Foreground (Text)

export CURSOR_COLOR="#e5c7a9" # Cursor

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
