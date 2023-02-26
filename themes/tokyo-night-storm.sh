#!/usr/bin/env bash

export PROFILE_NAME="Tokyo Night Storm"

export COLOR_01="#414868"           # Black (Host)
export COLOR_02="#f7768e"           # Red (Syntax string)
export COLOR_03="#9ece6a"           # Green (Command)
export COLOR_04="#e0af68"           # Yellow (Command second)
export COLOR_05="#7aa2f7"           # Blue (Path)
export COLOR_06="#bb9af7"           # Magenta (Syntax var)
export COLOR_07="#7dcfff"           # Cyan (Prompt)
export COLOR_08="#c0caf5"           # White

export COLOR_09="#414868"           # Bright Black
export COLOR_10="#f7768e"           # Bright Red (Command error)
export COLOR_11="#9ece6a"           # Bright Green (Exec)
export COLOR_12="#e0af68"           # Bright Yellow
export COLOR_13="#7aa2f7"           # Bright Blue (Folder)
export COLOR_14="#bb9af7"           # Bright Magenta
export COLOR_15="#7dcfff"           # Bright Cyan
export COLOR_16="#c0caf5"           # Bright White

export BACKGROUND_COLOR="#24283b"   # Background
export FOREGROUND_COLOR="#c0caf5"   # Foreground (Text)

export CURSOR_COLOR="#c0caf5" # Cursor

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
