#!/usr/bin/env bash

export PROFILE_NAME="Moonfly"

export COLOR_01="#323437"           # Black (Host)
export COLOR_02="#FF5454"           # Red (Syntax string)
export COLOR_03="#8CC85F"           # Green (Command)
export COLOR_04="#E3C78A"           # Yellow (Command second)
export COLOR_05="#80A0FF"           # Blue (Path)
export COLOR_06="#CF87E8"           # Magenta (Syntax var)
export COLOR_07="#79DAC8"           # Cyan (Prompt)
export COLOR_08="#C6C6C6"           # White

export COLOR_09="#949494"           # Bright Black
export COLOR_10="#FF5189"           # Bright Red (Command error)
export COLOR_11="#36C692"           # Bright Green (Exec)
export COLOR_12="#C2C292"           # Bright Yellow
export COLOR_13="#74B2FF"           # Bright Blue (Folder)
export COLOR_14="#AE81FF"           # Bright Magenta
export COLOR_15="#85DC85"           # Bright Cyan
export COLOR_16="#E4E4E4"           # Bright White

export BACKGROUND_COLOR="#080808"   # Background
export FOREGROUND_COLOR="#BDBDBD"   # Foreground (Text)

export CURSOR_COLOR="#9E9E9E" # Cursor

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
