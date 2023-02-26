#!/usr/bin/env bash

export PROFILE_NAME="Hybrid"

export COLOR_01="#282A2E"           # Black (Host)
export COLOR_02="#A54242"           # Red (Syntax string)
export COLOR_03="#8C9440"           # Green (Command)
export COLOR_04="#DE935F"           # Yellow (Command second)
export COLOR_05="#5F819D"           # Blue (Path)
export COLOR_06="#85678F"           # Magenta (Syntax var)
export COLOR_07="#5E8D87"           # Cyan (Prompt)
export COLOR_08="#969896"           # White

export COLOR_09="#373B41"           # Bright Black
export COLOR_10="#CC6666"           # Bright Red (Command error)
export COLOR_11="#B5BD68"           # Bright Green (Exec)
export COLOR_12="#F0C674"           # Bright Yellow
export COLOR_13="#81A2BE"           # Bright Blue (Folder)
export COLOR_14="#B294BB"           # Bright Magenta
export COLOR_15="#8ABEB7"           # Bright Cyan
export COLOR_16="#C5C8C6"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#94A3A5"   # Foreground (Text)

export CURSOR_COLOR="#94A3A5" # Cursor

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
