#!/usr/bin/env bash

export PROFILE_NAME="Argonaut"

export COLOR_01="#232323"           # Black (Host)
export COLOR_02="#FF000F"           # Red (Syntax string)
export COLOR_03="#8CE10B"           # Green (Command)
export COLOR_04="#FFB900"           # Yellow (Command second)
export COLOR_05="#008DF8"           # Blue (Path)
export COLOR_06="#6D43A6"           # Magenta (Syntax var)
export COLOR_07="#00D8EB"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#444444"           # Bright Black
export COLOR_10="#FF2740"           # Bright Red (Command error)
export COLOR_11="#ABE15B"           # Bright Green (Exec)
export COLOR_12="#FFD242"           # Bright Yellow
export COLOR_13="#0092FF"           # Bright Blue (Folder)
export COLOR_14="#9A5FEB"           # Bright Magenta
export COLOR_15="#67FFF0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E1019"   # Background
export FOREGROUND_COLOR="#FFFAF4"   # Foreground (Text)

export CURSOR_COLOR="#FFFAF4" # Cursor

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
