#!/usr/bin/env bash

export PROFILE_NAME="Gogh"

export COLOR_01="#292D3E"           # Black (Host)
export COLOR_02="#F07178"           # Red (Syntax string)
export COLOR_03="#62DE84"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#75A1FF"           # Blue (Path)
export COLOR_06="#F580FF"           # Magenta (Syntax var)
export COLOR_07="#60BAEC"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#959DCB"           # Bright Black
export COLOR_10="#F07178"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#FF5572"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#FFCB6B"           # Bright Magenta
export COLOR_15="#676E95"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#292D3E"   # Background
export FOREGROUND_COLOR="#BFC7D5"   # Foreground (Text)

export CURSOR_COLOR="#BFC7D5" # Cursor

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
