#!/usr/bin/env bash

export PROFILE_NAME="Warm Neon"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#e24346"           # Red (Syntax string)
export COLOR_03="#39b13a"           # Green (Command)
export COLOR_04="#dae145"           # Yellow (Command second)
export COLOR_05="#4261c5"           # Blue (Path)
export COLOR_06="#f920fb"           # Magenta (Syntax var)
export COLOR_07="#2abbd4"           # Cyan (Prompt)
export COLOR_08="#d0b8a3"           # White

export COLOR_09="#fefcfc"           # Bright Black
export COLOR_10="#e97071"           # Bright Red (Command error)
export COLOR_11="#9cc090"           # Bright Green (Exec)
export COLOR_12="#ddda7a"           # Bright Yellow
export COLOR_13="#7b91d6"           # Bright Blue (Folder)
export COLOR_14="#f674ba"           # Bright Magenta
export COLOR_15="#5ed1e5"           # Bright Cyan
export COLOR_16="#d8c8bb"           # Bright White

export BACKGROUND_COLOR="#404040"   # Background
export FOREGROUND_COLOR="#afdab6"   # Foreground (Text)

export CURSOR_COLOR="#afdab6" # Cursor

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
