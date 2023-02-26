#!/usr/bin/env bash

export PROFILE_NAME="C64"

export COLOR_01="#090300"           # Black (Host)
export COLOR_02="#883932"           # Red (Syntax string)
export COLOR_03="#55a049"           # Green (Command)
export COLOR_04="#bfce72"           # Yellow (Command second)
export COLOR_05="#40318d"           # Blue (Path)
export COLOR_06="#8b3f96"           # Magenta (Syntax var)
export COLOR_07="#67b6bd"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#883932"           # Bright Red (Command error)
export COLOR_11="#55a049"           # Bright Green (Exec)
export COLOR_12="#bfce72"           # Bright Yellow
export COLOR_13="#40318d"           # Bright Blue (Folder)
export COLOR_14="#8b3f96"           # Bright Magenta
export COLOR_15="#67b6bd"           # Bright Cyan
export COLOR_16="#f7f7f7"           # Bright White

export BACKGROUND_COLOR="#40318d"   # Background
export FOREGROUND_COLOR="#7869c4"   # Foreground (Text)

export CURSOR_COLOR="#7869c4" # Cursor

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
