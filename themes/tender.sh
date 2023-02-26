#!/usr/bin/env bash

export PROFILE_NAME="Tender"

export COLOR_01="#1D1D1D"           # Black (Host)
export COLOR_02="#C5152F"           # Red (Syntax string)
export COLOR_03="#C9D05C"           # Green (Command)
export COLOR_04="#FFC24B"           # Yellow (Command second)
export COLOR_05="#B3DEEF"           # Blue (Path)
export COLOR_06="#D3B987"           # Magenta (Syntax var)
export COLOR_07="#73CEF4"           # Cyan (Prompt)
export COLOR_08="#EEEEEE"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#F43753"           # Bright Red (Command error)
export COLOR_11="#D9E066"           # Bright Green (Exec)
export COLOR_12="#FACC72"           # Bright Yellow
export COLOR_13="#C0EAFB"           # Bright Blue (Folder)
export COLOR_14="#EFD093"           # Bright Magenta
export COLOR_15="#A1D6EC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#EEEEEE"   # Foreground (Text)

export CURSOR_COLOR="#EEEEEE" # Cursor

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
