#!/usr/bin/env bash

export PROFILE_NAME="Adventure Time"

export COLOR_01="#050404"           # Black (Host)
export COLOR_02="#bd0013"           # Red (Syntax string)
export COLOR_03="#4ab118"           # Green (Command)
export COLOR_04="#e7741e"           # Yellow (Command second)
export COLOR_05="#0f4ac6"           # Blue (Path)
export COLOR_06="#665993"           # Magenta (Syntax var)
export COLOR_07="#70a598"           # Cyan (Prompt)
export COLOR_08="#f8dcc0"           # White

export COLOR_09="#4e7cbf"           # Bright Black
export COLOR_10="#fc5f5a"           # Bright Red (Command error)
export COLOR_11="#9eff6e"           # Bright Green (Exec)
export COLOR_12="#efc11a"           # Bright Yellow
export COLOR_13="#1997c6"           # Bright Blue (Folder)
export COLOR_14="#9b5953"           # Bright Magenta
export COLOR_15="#c8faf4"           # Bright Cyan
export COLOR_16="#f6f5fb"           # Bright White

export BACKGROUND_COLOR="#1f1d45"   # Background
export FOREGROUND_COLOR="#f8dcc0"   # Foreground (Text)

export CURSOR_COLOR="#f8dcc0" # Cursor

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
