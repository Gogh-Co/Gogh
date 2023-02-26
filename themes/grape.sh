#!/usr/bin/env bash

export PROFILE_NAME="Grape"

export COLOR_01="#2d283f"           # Black (Host)
export COLOR_02="#ed2261"           # Red (Syntax string)
export COLOR_03="#1fa91b"           # Green (Command)
export COLOR_04="#8ddc20"           # Yellow (Command second)
export COLOR_05="#487df4"           # Blue (Path)
export COLOR_06="#8d35c9"           # Magenta (Syntax var)
export COLOR_07="#3bdeed"           # Cyan (Prompt)
export COLOR_08="#9e9ea0"           # White

export COLOR_09="#59516a"           # Bright Black
export COLOR_10="#f0729a"           # Bright Red (Command error)
export COLOR_11="#53aa5e"           # Bright Green (Exec)
export COLOR_12="#b2dc87"           # Bright Yellow
export COLOR_13="#a9bcec"           # Bright Blue (Folder)
export COLOR_14="#ad81c2"           # Bright Magenta
export COLOR_15="#9de3eb"           # Bright Cyan
export COLOR_16="#a288f7"           # Bright White

export BACKGROUND_COLOR="#171423"   # Background
export FOREGROUND_COLOR="#9f9fa1"   # Foreground (Text)

export CURSOR_COLOR="#9f9fa1" # Cursor

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
