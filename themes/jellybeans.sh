#!/usr/bin/env bash

export PROFILE_NAME="Jellybeans"

export COLOR_01="#929292"           # Black (Host)
export COLOR_02="#e27373"           # Red (Syntax string)
export COLOR_03="#94b979"           # Green (Command)
export COLOR_04="#ffba7b"           # Yellow (Command second)
export COLOR_05="#97bedc"           # Blue (Path)
export COLOR_06="#e1c0fa"           # Magenta (Syntax var)
export COLOR_07="#00988e"           # Cyan (Prompt)
export COLOR_08="#dedede"           # White

export COLOR_09="#bdbdbd"           # Bright Black
export COLOR_10="#ffa1a1"           # Bright Red (Command error)
export COLOR_11="#bddeab"           # Bright Green (Exec)
export COLOR_12="#ffdca0"           # Bright Yellow
export COLOR_13="#b1d8f6"           # Bright Blue (Folder)
export COLOR_14="#fbdaff"           # Bright Magenta
export COLOR_15="#1ab2a8"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#dedede"   # Foreground (Text)

export CURSOR_COLOR="#dedede" # Cursor

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
