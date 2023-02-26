#!/usr/bin/env bash

export PROFILE_NAME="Freya"

export COLOR_01="#073642"           # Black (Host)
export COLOR_02="#dc322f"           # Red (Syntax string)
export COLOR_03="#859900"           # Green (Command)
export COLOR_04="#b58900"           # Yellow (Command second)
export COLOR_05="#268bd2"           # Blue (Path)
export COLOR_06="#ec0048"           # Magenta (Syntax var)
export COLOR_07="#2aa198"           # Cyan (Prompt)
export COLOR_08="#94a3a5"           # White

export COLOR_09="#586e75"           # Bright Black
export COLOR_10="#cb4b16"           # Bright Red (Command error)
export COLOR_11="#859900"           # Bright Green (Exec)
export COLOR_12="#b58900"           # Bright Yellow
export COLOR_13="#268bd2"           # Bright Blue (Folder)
export COLOR_14="#d33682"           # Bright Magenta
export COLOR_15="#2aa198"           # Bright Cyan
export COLOR_16="#6c71c4"           # Bright White

export BACKGROUND_COLOR="#252e32"   # Background
export FOREGROUND_COLOR="#94a3a5"   # Foreground (Text)

export CURSOR_COLOR="#839496" # Cursor

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
