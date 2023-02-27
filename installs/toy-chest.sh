#!/usr/bin/env bash

export PROFILE_NAME="Toy Chest"

export COLOR_01="#2C3F58"           # Black (Host)
export COLOR_02="#BE2D26"           # Red (Syntax string)
export COLOR_03="#1A9172"           # Green (Command)
export COLOR_04="#DB8E27"           # Yellow (Command second)
export COLOR_05="#325D96"           # Blue (Path)
export COLOR_06="#8A5EDC"           # Magenta (Syntax var)
export COLOR_07="#35A08F"           # Cyan (Prompt)
export COLOR_08="#23D183"           # White

export COLOR_09="#336889"           # Bright Black
export COLOR_10="#DD5944"           # Bright Red (Command error)
export COLOR_11="#31D07B"           # Bright Green (Exec)
export COLOR_12="#E7D84B"           # Bright Yellow
export COLOR_13="#34A6DA"           # Bright Blue (Folder)
export COLOR_14="#AE6BDC"           # Bright Magenta
export COLOR_15="#42C3AE"           # Bright Cyan
export COLOR_16="#D5D5D5"           # Bright White

export BACKGROUND_COLOR="#24364B"   # Background
export FOREGROUND_COLOR="#31D07B"   # Foreground (Text)

export CURSOR_COLOR="#31D07B" # Cursor

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
