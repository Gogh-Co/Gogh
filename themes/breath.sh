#!/usr/bin/env bash

export PROFILE_NAME="Breath"

export COLOR_01="#1E2229"           # Black (Host)
export COLOR_02="#ED1515"           # Red (Syntax string)
export COLOR_03="#44853A"           # Green (Command)
export COLOR_04="#F67400"           # Yellow (Command second)
export COLOR_05="#1D99F3"           # Blue (Path)
export COLOR_06="#9B59B6"           # Magenta (Syntax var)
export COLOR_07="#1ABC9C"           # Cyan (Prompt)
export COLOR_08="#FCFCFC"           # White

export COLOR_09="#7F8C8D"           # Bright Black
export COLOR_10="#C0392B"           # Bright Red (Command error)
export COLOR_11="#55A649"           # Bright Green (Exec)
export COLOR_12="#FDBC4B"           # Bright Yellow
export COLOR_13="#3DAEE9"           # Bright Blue (Folder)
export COLOR_14="#8E44AD"           # Bright Magenta
export COLOR_15="#16A085"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E2229"   # Background
export FOREGROUND_COLOR="#17A88B"   # Foreground (Text)

export CURSOR_COLOR="#17A88B" # Cursor

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
