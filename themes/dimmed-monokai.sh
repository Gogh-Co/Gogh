#!/usr/bin/env bash

export PROFILE_NAME="Dimmed Monokai"

export COLOR_01="#3A3D43"           # Black (Host)
export COLOR_02="#BE3F48"           # Red (Syntax string)
export COLOR_03="#879A3B"           # Green (Command)
export COLOR_04="#C5A635"           # Yellow (Command second)
export COLOR_05="#4F76A1"           # Blue (Path)
export COLOR_06="#855C8D"           # Magenta (Syntax var)
export COLOR_07="#578FA4"           # Cyan (Prompt)
export COLOR_08="#B9BCBA"           # White

export COLOR_09="#888987"           # Bright Black
export COLOR_10="#FB001F"           # Bright Red (Command error)
export COLOR_11="#0F722F"           # Bright Green (Exec)
export COLOR_12="#C47033"           # Bright Yellow
export COLOR_13="#186DE3"           # Bright Blue (Folder)
export COLOR_14="#FB0067"           # Bright Magenta
export COLOR_15="#2E706D"           # Bright Cyan
export COLOR_16="#FDFFB9"           # Bright White

export BACKGROUND_COLOR="#1F1F1F"   # Background
export FOREGROUND_COLOR="#B9BCBA"   # Foreground (Text)

export CURSOR_COLOR="#B9BCBA" # Cursor

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
