#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Frappé"

export COLOR_01="#51576D"           # Black (Host)
export COLOR_02="#E78284"           # Red (Syntax string)
export COLOR_03="#A6D189"           # Green (Command)
export COLOR_04="#E5C890"           # Yellow (Command second)
export COLOR_05="#8CAAEE"           # Blue (Path)
export COLOR_06="#F4B8E4"           # Magenta (Syntax var)
export COLOR_07="#81C8BE"           # Cyan (Prompt)
export COLOR_08="#B5BFE2"           # White

export COLOR_09="#626880"           # Bright Black
export COLOR_10="#E78284"           # Bright Red (Command error)
export COLOR_11="#A6D189"           # Bright Green (Exec)
export COLOR_12="#E5C890"           # Bright Yellow
export COLOR_13="#8CAAEE"           # Bright Blue (Folder)
export COLOR_14="#F4B8E4"           # Bright Magenta
export COLOR_15="#81C8BE"           # Bright Cyan
export COLOR_16="#A5ADCE"           # Bright White

export BACKGROUND_COLOR="#303446"   # Background
export FOREGROUND_COLOR="#C6D0F5"   # Foreground (Text)

export CURSOR_COLOR="#C6D0F5" # Cursor

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
