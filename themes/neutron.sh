#!/usr/bin/env bash

export PROFILE_NAME="Neutron"

export COLOR_01="#23252b"           # Black (Host)
export COLOR_02="#b54036"           # Red (Syntax string)
export COLOR_03="#5ab977"           # Green (Command)
export COLOR_04="#deb566"           # Yellow (Command second)
export COLOR_05="#6a7c93"           # Blue (Path)
export COLOR_06="#a4799d"           # Magenta (Syntax var)
export COLOR_07="#3f94a8"           # Cyan (Prompt)
export COLOR_08="#e6e8ef"           # White

export COLOR_09="#23252b"           # Bright Black
export COLOR_10="#b54036"           # Bright Red (Command error)
export COLOR_11="#5ab977"           # Bright Green (Exec)
export COLOR_12="#deb566"           # Bright Yellow
export COLOR_13="#6a7c93"           # Bright Blue (Folder)
export COLOR_14="#a4799d"           # Bright Magenta
export COLOR_15="#3f94a8"           # Bright Cyan
export COLOR_16="#ebedf2"           # Bright White

export BACKGROUND_COLOR="#1c1e22"   # Background
export FOREGROUND_COLOR="#e6e8ef"   # Foreground (Text)

export CURSOR_COLOR="#e6e8ef" # Cursor

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
