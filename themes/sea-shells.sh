#!/usr/bin/env bash

export PROFILE_NAME="Sea Shells"

export COLOR_01="#17384C"           # Black (Host)
export COLOR_02="#D15123"           # Red (Syntax string)
export COLOR_03="#027C9B"           # Green (Command)
export COLOR_04="#FCA02F"           # Yellow (Command second)
export COLOR_05="#1E4950"           # Blue (Path)
export COLOR_06="#68D4F1"           # Magenta (Syntax var)
export COLOR_07="#50A3B5"           # Cyan (Prompt)
export COLOR_08="#DEB88D"           # White

export COLOR_09="#434B53"           # Bright Black
export COLOR_10="#D48678"           # Bright Red (Command error)
export COLOR_11="#628D98"           # Bright Green (Exec)
export COLOR_12="#FDD39F"           # Bright Yellow
export COLOR_13="#1BBCDD"           # Bright Blue (Folder)
export COLOR_14="#BBE3EE"           # Bright Magenta
export COLOR_15="#87ACB4"           # Bright Cyan
export COLOR_16="#FEE4CE"           # Bright White

export BACKGROUND_COLOR="#09141B"   # Background
export FOREGROUND_COLOR="#DEB88D"   # Foreground (Text)

export CURSOR_COLOR="#DEB88D" # Cursor

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
