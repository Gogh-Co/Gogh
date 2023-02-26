#!/usr/bin/env bash

export PROFILE_NAME="Square"

export COLOR_01="#050505"           # Black (Host)
export COLOR_02="#E9897C"           # Red (Syntax string)
export COLOR_03="#B6377D"           # Green (Command)
export COLOR_04="#ECEBBE"           # Yellow (Command second)
export COLOR_05="#A9CDEB"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#C9CAEC"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#141414"           # Bright Black
export COLOR_10="#F99286"           # Bright Red (Command error)
export COLOR_11="#C3F786"           # Bright Green (Exec)
export COLOR_12="#FCFBCC"           # Bright Yellow
export COLOR_13="#B6DEFB"           # Bright Blue (Folder)
export COLOR_14="#AD7FA8"           # Bright Magenta
export COLOR_15="#D7D9FC"           # Bright Cyan
export COLOR_16="#E2E2E2"           # Bright White

export BACKGROUND_COLOR="#0A1E24"   # Background
export FOREGROUND_COLOR="#A1A1A1"   # Foreground (Text)

export CURSOR_COLOR="#A1A1A1" # Cursor

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
