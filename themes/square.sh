#!/usr/bin/env bash

export PROFILE_NAME="Square"

export COLOR_01="#050505"           # Black (Host)
export COLOR_02="#e9897c"           # Red (Syntax string)
export COLOR_03="#b6377d"           # Green (Command)
export COLOR_04="#ecebbe"           # Yellow (Command second)
export COLOR_05="#a9cdeb"           # Blue (Path)
export COLOR_06="#75507b"           # Magenta (Syntax var)
export COLOR_07="#c9caec"           # Cyan (Prompt)
export COLOR_08="#f2f2f2"           # White

export COLOR_09="#141414"           # Bright Black
export COLOR_10="#f99286"           # Bright Red (Command error)
export COLOR_11="#c3f786"           # Bright Green (Exec)
export COLOR_12="#fcfbcc"           # Bright Yellow
export COLOR_13="#b6defb"           # Bright Blue (Folder)
export COLOR_14="#ad7fa8"           # Bright Magenta
export COLOR_15="#d7d9fc"           # Bright Cyan
export COLOR_16="#e2e2e2"           # Bright White

export BACKGROUND_COLOR="#0a1e24"   # Background
export FOREGROUND_COLOR="#a1a1a1"   # Foreground (Text)

export CURSOR_COLOR="#a1a1a1" # Cursor

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
