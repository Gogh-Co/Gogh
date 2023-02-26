#!/usr/bin/env bash

export PROFILE_NAME="Elic"

export COLOR_01="#303030"           # Black (Host)
export COLOR_02="#e1321a"           # Red (Syntax string)
export COLOR_03="#6ab017"           # Green (Command)
export COLOR_04="#ffc005"           # Yellow (Command second)
export COLOR_05="#729FCF"           # Blue (Path)
export COLOR_06="#ec0048"           # Magenta (Syntax var)
export COLOR_07="#f2f2f2"           # Cyan (Prompt)
export COLOR_08="#2aa7e7"           # White

export COLOR_09="#5d5d5d"           # Bright Black
export COLOR_10="#ff361e"           # Bright Red (Command error)
export COLOR_11="#7bc91f"           # Bright Green (Exec)
export COLOR_12="#ffd00a"           # Bright Yellow
export COLOR_13="#0071ff"           # Bright Blue (Folder)
export COLOR_14="#ff1d62"           # Bright Magenta
export COLOR_15="#4bb8fd"           # Bright Cyan
export COLOR_16="#a020f0"           # Bright White

export BACKGROUND_COLOR="#4A453E"   # Background
export FOREGROUND_COLOR="#f2f2f2"   # Foreground (Text)

export CURSOR_COLOR="#f2f2f2" # Cursor

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
