#!/usr/bin/env bash

export PROFILE_NAME="Gotham"

export COLOR_01="#0a0f14"           # Black (Host)
export COLOR_02="#c33027"           # Red (Syntax string)
export COLOR_03="#26a98b"           # Green (Command)
export COLOR_04="#edb54b"           # Yellow (Command second)
export COLOR_05="#195465"           # Blue (Path)
export COLOR_06="#4e5165"           # Magenta (Syntax var)
export COLOR_07="#33859d"           # Cyan (Prompt)
export COLOR_08="#98d1ce"           # White

export COLOR_09="#10151b"           # Bright Black
export COLOR_10="#d26939"           # Bright Red (Command error)
export COLOR_11="#081f2d"           # Bright Green (Exec)
export COLOR_12="#245361"           # Bright Yellow
export COLOR_13="#093748"           # Bright Blue (Folder)
export COLOR_14="#888ba5"           # Bright Magenta
export COLOR_15="#599caa"           # Bright Cyan
export COLOR_16="#d3ebe9"           # Bright White

export BACKGROUND_COLOR="#0a0f14"   # Background
export FOREGROUND_COLOR="#98d1ce"   # Foreground (Text)

export CURSOR_COLOR="#98d1ce" # Cursor

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
