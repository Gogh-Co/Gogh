#!/usr/bin/env bash

export PROFILE_NAME="Medallion"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B64C00"           # Red (Syntax string)
export COLOR_03="#7C8B16"           # Green (Command)
export COLOR_04="#D3BD26"           # Yellow (Command second)
export COLOR_05="#616BB0"           # Blue (Path)
export COLOR_06="#8C5A90"           # Magenta (Syntax var)
export COLOR_07="#916C25"           # Cyan (Prompt)
export COLOR_08="#CAC29A"           # White

export COLOR_09="#5E5219"           # Bright Black
export COLOR_10="#FF9149"           # Bright Red (Command error)
export COLOR_11="#B2CA3B"           # Bright Green (Exec)
export COLOR_12="#FFE54A"           # Bright Yellow
export COLOR_13="#ACB8FF"           # Bright Blue (Folder)
export COLOR_14="#FFA0FF"           # Bright Magenta
export COLOR_15="#FFBC51"           # Bright Cyan
export COLOR_16="#FED698"           # Bright White

export BACKGROUND_COLOR="#1D1908"   # Background
export FOREGROUND_COLOR="#CAC296"   # Foreground (Text)

export CURSOR_COLOR="#CAC296" # Cursor

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
