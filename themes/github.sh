#!/usr/bin/env bash

export PROFILE_NAME="Github"

export COLOR_01="#3e3e3e"           # Black (Host)
export COLOR_02="#970b16"           # Red (Syntax string)
export COLOR_03="#07962a"           # Green (Command)
export COLOR_04="#f8eec7"           # Yellow (Command second)
export COLOR_05="#003e8a"           # Blue (Path)
export COLOR_06="#e94691"           # Magenta (Syntax var)
export COLOR_07="#89d1ec"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#de0000"           # Bright Red (Command error)
export COLOR_11="#87d5a2"           # Bright Green (Exec)
export COLOR_12="#f1d007"           # Bright Yellow
export COLOR_13="#2e6cba"           # Bright Blue (Folder)
export COLOR_14="#ffa29f"           # Bright Magenta
export COLOR_15="#1cfafe"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#f4f4f4"   # Background
export FOREGROUND_COLOR="#3e3e3e"   # Foreground (Text)

export CURSOR_COLOR="#3e3e3e" # Cursor

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
