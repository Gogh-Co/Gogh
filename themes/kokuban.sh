#!/usr/bin/env bash

export PROFILE_NAME="Kokuban"

export COLOR_01="#2E8744"           # Black (Host)
export COLOR_02="#D84E4C"           # Red (Syntax string)
export COLOR_03="#95DA5A"           # Green (Command)
export COLOR_04="#D6E264"           # Yellow (Command second)
export COLOR_05="#4B9ED7"           # Blue (Path)
export COLOR_06="#945FC5"           # Magenta (Syntax var)
export COLOR_07="#D89B25"           # Cyan (Prompt)
export COLOR_08="#D8E2D7"           # White

export COLOR_09="#34934F"           # Bright Black
export COLOR_10="#FF4F59"           # Bright Red (Command error)
export COLOR_11="#AFF56A"           # Bright Green (Exec)
export COLOR_12="#FCFF75"           # Bright Yellow
export COLOR_13="#57AEFF"           # Bright Blue (Folder)
export COLOR_14="#AE63E9"           # Bright Magenta
export COLOR_15="#FFAA2B"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#0D4A08"   # Background
export FOREGROUND_COLOR="#D8E2D7"   # Foreground (Text)

export CURSOR_COLOR="#D8E2D7" # Cursor

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
