#!/usr/bin/env bash

export PROFILE_NAME="Powershell"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#7E0008"           # Red (Syntax string)
export COLOR_03="#098003"           # Green (Command)
export COLOR_04="#C4A000"           # Yellow (Command second)
export COLOR_05="#010083"           # Blue (Path)
export COLOR_06="#D33682"           # Magenta (Syntax var)
export COLOR_07="#0E807F"           # Cyan (Prompt)
export COLOR_08="#7F7C7F"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#EF2929"           # Bright Red (Command error)
export COLOR_11="#1CFE3C"           # Bright Green (Exec)
export COLOR_12="#FEFE45"           # Bright Yellow
export COLOR_13="#268AD2"           # Bright Blue (Folder)
export COLOR_14="#FE13FA"           # Bright Magenta
export COLOR_15="#29FFFE"           # Bright Cyan
export COLOR_16="#C2C1C3"           # Bright White

export BACKGROUND_COLOR="#052454"   # Background
export FOREGROUND_COLOR="#F6F6F7"   # Foreground (Text)

export CURSOR_COLOR="#F6F6F7" # Cursor

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
