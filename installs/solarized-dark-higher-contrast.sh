#!/usr/bin/env bash

export PROFILE_NAME="Solarized Dark Higher Contrast"

export COLOR_01="#002831"           # Black (Host)
export COLOR_02="#D11C24"           # Red (Syntax string)
export COLOR_03="#6CBE6C"           # Green (Command)
export COLOR_04="#A57706"           # Yellow (Command second)
export COLOR_05="#2176C7"           # Blue (Path)
export COLOR_06="#C61C6F"           # Magenta (Syntax var)
export COLOR_07="#259286"           # Cyan (Prompt)
export COLOR_08="#EAE3CB"           # White

export COLOR_09="#006488"           # Bright Black
export COLOR_10="#F5163B"           # Bright Red (Command error)
export COLOR_11="#51EF84"           # Bright Green (Exec)
export COLOR_12="#B27E28"           # Bright Yellow
export COLOR_13="#178EC8"           # Bright Blue (Folder)
export COLOR_14="#E24D8E"           # Bright Magenta
export COLOR_15="#00B39E"           # Bright Cyan
export COLOR_16="#FCF4DC"           # Bright White

export BACKGROUND_COLOR="#001E27"   # Background
export FOREGROUND_COLOR="#9CC2C3"   # Foreground (Text)

export CURSOR_COLOR="#9CC2C3" # Cursor

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
