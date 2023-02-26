#!/usr/bin/env bash

export PROFILE_NAME="Red Alert"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#d62e4e"           # Red (Syntax string)
export COLOR_03="#71be6b"           # Green (Command)
export COLOR_04="#beb86b"           # Yellow (Command second)
export COLOR_05="#489bee"           # Blue (Path)
export COLOR_06="#e979d7"           # Magenta (Syntax var)
export COLOR_07="#6bbeb8"           # Cyan (Prompt)
export COLOR_08="#d6d6d6"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#e02553"           # Bright Red (Command error)
export COLOR_11="#aff08c"           # Bright Green (Exec)
export COLOR_12="#dfddb7"           # Bright Yellow
export COLOR_13="#65aaf1"           # Bright Blue (Folder)
export COLOR_14="#ddb7df"           # Bright Magenta
export COLOR_15="#b7dfdd"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#762423"   # Background
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
