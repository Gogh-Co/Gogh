#!/usr/bin/env bash

export PROFILE_NAME="Monokai Dark"

export COLOR_01="#75715E"           # Black (Host)
export COLOR_02="#F92672"           # Red (Syntax string)
export COLOR_03="#A6E22E"           # Green (Command)
export COLOR_04="#F4BF75"           # Yellow (Command second)
export COLOR_05="#66D9EF"           # Blue (Path)
export COLOR_06="#AE81FF"           # Magenta (Syntax var)
export COLOR_07="#2AA198"           # Cyan (Prompt)
export COLOR_08="#F9F8F5"           # White

export COLOR_09="#272822"           # Bright Black
export COLOR_10="#F92672"           # Bright Red (Command error)
export COLOR_11="#A6E22E"           # Bright Green (Exec)
export COLOR_12="#F4BF75"           # Bright Yellow
export COLOR_13="#66D9EF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#2AA198"           # Bright Cyan
export COLOR_16="#F8F8F2"           # Bright White

export BACKGROUND_COLOR="#272822"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F2" # Cursor

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
