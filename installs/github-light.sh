#!/usr/bin/env bash

export PROFILE_NAME="Github Light"

export COLOR_01="#24292f"           # Black (Host)
export COLOR_02="#cf222e"           # Red (Syntax string)
export COLOR_03="#1a7f37"           # Green (Command)
export COLOR_04="#9a6700"           # Yellow (Command second)
export COLOR_05="#0969da"           # Blue (Path)
export COLOR_06="#8250df"           # Magenta (Syntax var)
export COLOR_07="#1b7c83"           # Cyan (Prompt)
export COLOR_08="#6e7781"           # White

export COLOR_09="#57606a"           # Bright Black
export COLOR_10="#a40e26"           # Bright Red (Command error)
export COLOR_11="#2da44e"           # Bright Green (Exec)
export COLOR_12="#bf8700"           # Bright Yellow
export COLOR_13="#218bff"           # Bright Blue (Folder)
export COLOR_14="#a475f9"           # Bright Magenta
export COLOR_15="#3192aa"           # Bright Cyan
export COLOR_16="#8c959f"           # Bright White

export BACKGROUND_COLOR="#f6f8fa"   # Background
export FOREGROUND_COLOR="#1f2328"   # Foreground (Text)

export CURSOR_COLOR="#1f2328" # Cursor

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
