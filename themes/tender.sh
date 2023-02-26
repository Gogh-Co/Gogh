#!/usr/bin/env bash

export PROFILE_NAME="Tender"

export COLOR_01="#1d1d1d"           # Black (Host)
export COLOR_02="#c5152f"           # Red (Syntax string)
export COLOR_03="#c9d05c"           # Green (Command)
export COLOR_04="#ffc24b"           # Yellow (Command second)
export COLOR_05="#b3deef"           # Blue (Path)
export COLOR_06="#d3b987"           # Magenta (Syntax var)
export COLOR_07="#73cef4"           # Cyan (Prompt)
export COLOR_08="#eeeeee"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#f43753"           # Bright Red (Command error)
export COLOR_11="#d9e066"           # Bright Green (Exec)
export COLOR_12="#facc72"           # Bright Yellow
export COLOR_13="#c0eafb"           # Bright Blue (Folder)
export COLOR_14="#efd093"           # Bright Magenta
export COLOR_15="#a1d6ec"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#EEEEEE"   # Foreground (Text)

export CURSOR_COLOR="#EEEEEE" # Cursor

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
