#!/usr/bin/env bash

export PROFILE_NAME="Aura"

export COLOR_01="#110F18"           # Black (Host)
export COLOR_02="#FF6767"           # Red (Syntax string)
export COLOR_03="#61FFCA"           # Green (Command)
export COLOR_04="#FFCA85"           # Yellow (Command second)
export COLOR_05="#A277FF"           # Blue (Path)
export COLOR_06="#A277FF"           # Magenta (Syntax var)
export COLOR_07="#61FFCA"           # Cyan (Prompt)
export COLOR_08="#EDECEE"           # White

export COLOR_09="#6D6D6D"           # Bright Black
export COLOR_10="#FFCA85"           # Bright Red (Command error)
export COLOR_11="#A277FF"           # Bright Green (Exec)
export COLOR_12="#FFCA85"           # Bright Yellow
export COLOR_13="#A277FF"           # Bright Blue (Folder)
export COLOR_14="#A277FF"           # Bright Magenta
export COLOR_15="#61FFCA"           # Bright Cyan
export COLOR_16="#EDECEE"           # Bright White

export BACKGROUND_COLOR="#15141B"   # Background
export FOREGROUND_COLOR="#EDECEE"   # Foreground (Text)

export CURSOR_COLOR="#EDECEE" # Cursor

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
