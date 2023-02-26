#!/usr/bin/env bash

export PROFILE_NAME="Harper"

export COLOR_01="#010101"           # Black (Host)
export COLOR_02="#f8b63f"           # Red (Syntax string)
export COLOR_03="#7fb5e1"           # Green (Command)
export COLOR_04="#d6da25"           # Yellow (Command second)
export COLOR_05="#489e48"           # Blue (Path)
export COLOR_06="#b296c6"           # Magenta (Syntax var)
export COLOR_07="#f5bfd7"           # Cyan (Prompt)
export COLOR_08="#a8a49d"           # White

export COLOR_09="#726e6a"           # Bright Black
export COLOR_10="#f8b63f"           # Bright Red (Command error)
export COLOR_11="#7fb5e1"           # Bright Green (Exec)
export COLOR_12="#d6da25"           # Bright Yellow
export COLOR_13="#489e48"           # Bright Blue (Folder)
export COLOR_14="#b296c6"           # Bright Magenta
export COLOR_15="#f5bfd7"           # Bright Cyan
export COLOR_16="#fefbea"           # Bright White

export BACKGROUND_COLOR="#010101"   # Background
export FOREGROUND_COLOR="#a8a49d"   # Foreground (Text)

export CURSOR_COLOR="#a8a49d" # Cursor

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
