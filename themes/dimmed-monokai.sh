#!/usr/bin/env bash

export PROFILE_NAME="Dimmed Monokai"

export COLOR_01="#3a3d43"           # Black (Host)
export COLOR_02="#be3f48"           # Red (Syntax string)
export COLOR_03="#879a3b"           # Green (Command)
export COLOR_04="#c5a635"           # Yellow (Command second)
export COLOR_05="#4f76a1"           # Blue (Path)
export COLOR_06="#855c8d"           # Magenta (Syntax var)
export COLOR_07="#578fa4"           # Cyan (Prompt)
export COLOR_08="#b9bcba"           # White

export COLOR_09="#888987"           # Bright Black
export COLOR_10="#fb001f"           # Bright Red (Command error)
export COLOR_11="#0f722f"           # Bright Green (Exec)
export COLOR_12="#c47033"           # Bright Yellow
export COLOR_13="#186de3"           # Bright Blue (Folder)
export COLOR_14="#fb0067"           # Bright Magenta
export COLOR_15="#2e706d"           # Bright Cyan
export COLOR_16="#fdffb9"           # Bright White

export BACKGROUND_COLOR="#1f1f1f"   # Background
export FOREGROUND_COLOR="#b9bcba"   # Foreground (Text)

export CURSOR_COLOR="#b9bcba" # Cursor

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
