#!/usr/bin/env bash

export PROFILE_NAME="Aura"

export COLOR_01="#110f18"           # Black (Host)
export COLOR_02="#ff6767"           # Red (Syntax string)
export COLOR_03="#61ffca"           # Green (Command)
export COLOR_04="#ffca85"           # Yellow (Command second)
export COLOR_05="#a277ff"           # Blue (Path)
export COLOR_06="#a277ff"           # Magenta (Syntax var)
export COLOR_07="#61ffca"           # Cyan (Prompt)
export COLOR_08="#edecee"           # White

export COLOR_09="#6d6d6d"           # Bright Black
export COLOR_10="#ffca85"           # Bright Red (Command error)
export COLOR_11="#a277ff"           # Bright Green (Exec)
export COLOR_12="#ffca85"           # Bright Yellow
export COLOR_13="#a277ff"           # Bright Blue (Folder)
export COLOR_14="#a277ff"           # Bright Magenta
export COLOR_15="#61ffca"           # Bright Cyan
export COLOR_16="#edecee"           # Bright White

export BACKGROUND_COLOR="#15141B"   # Background
export FOREGROUND_COLOR="#edecee"   # Foreground (Text)

export CURSOR_COLOR="#edecee" # Cursor

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
