#!/usr/bin/env bash

export PROFILE_NAME="Sweet Terminal"

export COLOR_01="#3F3F54"           # Black (Host)
export COLOR_02="#F60055"           # Red (Syntax string)
export COLOR_03="#06C993"           # Green (Command)
export COLOR_04="#9700BE"           # Yellow (Command second)
export COLOR_05="#F69154"           # Blue (Path)
export COLOR_06="#EC89CB"           # Magenta (Syntax var)
export COLOR_07="#60ADEC"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#959DCB"           # Bright Black
export COLOR_10="#F60055"           # Bright Red (Command error)
export COLOR_11="#06C993"           # Bright Green (Exec)
export COLOR_12="#9700BE"           # Bright Yellow
export COLOR_13="#F69154"           # Bright Blue (Folder)
export COLOR_14="#EC89CB"           # Bright Magenta
export COLOR_15="#00DDED"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222235"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
