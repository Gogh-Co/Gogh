#!/usr/bin/env bash

export PROFILE_NAME="Neutron"

export COLOR_01="#23252B"           # Black (Host)
export COLOR_02="#B54036"           # Red (Syntax string)
export COLOR_03="#5AB977"           # Green (Command)
export COLOR_04="#DEB566"           # Yellow (Command second)
export COLOR_05="#6A7C93"           # Blue (Path)
export COLOR_06="#A4799D"           # Magenta (Syntax var)
export COLOR_07="#3F94A8"           # Cyan (Prompt)
export COLOR_08="#E6E8EF"           # White

export COLOR_09="#23252B"           # Bright Black
export COLOR_10="#B54036"           # Bright Red (Command error)
export COLOR_11="#5AB977"           # Bright Green (Exec)
export COLOR_12="#DEB566"           # Bright Yellow
export COLOR_13="#6A7C93"           # Bright Blue (Folder)
export COLOR_14="#A4799D"           # Bright Magenta
export COLOR_15="#3F94A8"           # Bright Cyan
export COLOR_16="#EBEDF2"           # Bright White

export BACKGROUND_COLOR="#1C1E22"   # Background
export FOREGROUND_COLOR="#E6E8EF"   # Foreground (Text)

export CURSOR_COLOR="#E6E8EF" # Cursor

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
