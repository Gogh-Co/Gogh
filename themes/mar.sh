#!/usr/bin/env bash

export PROFILE_NAME="Mar"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#b5407b"           # Red (Syntax string)
export COLOR_03="#7bb540"           # Green (Command)
export COLOR_04="#b57b40"           # Yellow (Command second)
export COLOR_05="#407bb5"           # Blue (Path)
export COLOR_06="#7b40b5"           # Magenta (Syntax var)
export COLOR_07="#40b57b"           # Cyan (Prompt)
export COLOR_08="#f8f8f8"           # White

export COLOR_09="#737373"           # Bright Black
export COLOR_10="#cd73a0"           # Bright Red (Command error)
export COLOR_11="#a0cd73"           # Bright Green (Exec)
export COLOR_12="#cda073"           # Bright Yellow
export COLOR_13="#73a0cd"           # Bright Blue (Folder)
export COLOR_14="#a073cd"           # Bright Magenta
export COLOR_15="#73cda0"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#23476a"   # Foreground (Text)

export CURSOR_COLOR="#23476a" # Cursor

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
