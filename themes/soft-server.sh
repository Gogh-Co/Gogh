#!/usr/bin/env bash

export PROFILE_NAME="Soft Server"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#a2686a"           # Red (Syntax string)
export COLOR_03="#9aa56a"           # Green (Command)
export COLOR_04="#a3906a"           # Yellow (Command second)
export COLOR_05="#6b8fa3"           # Blue (Path)
export COLOR_06="#6a71a3"           # Magenta (Syntax var)
export COLOR_07="#6ba58f"           # Cyan (Prompt)
export COLOR_08="#99a3a2"           # White

export COLOR_09="#666c6c"           # Bright Black
export COLOR_10="#dd5c60"           # Bright Red (Command error)
export COLOR_11="#bfdf55"           # Bright Green (Exec)
export COLOR_12="#deb360"           # Bright Yellow
export COLOR_13="#62b1df"           # Bright Blue (Folder)
export COLOR_14="#606edf"           # Bright Magenta
export COLOR_15="#64e39c"           # Bright Cyan
export COLOR_16="#d2e0de"           # Bright White

export BACKGROUND_COLOR="#242626"   # Background
export FOREGROUND_COLOR="#99a3a2"   # Foreground (Text)

export CURSOR_COLOR="#99a3a2" # Cursor

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
