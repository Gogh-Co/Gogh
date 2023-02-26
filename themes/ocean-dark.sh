#!/usr/bin/env bash

export PROFILE_NAME="Ocean Dark"

export COLOR_01="#4F4F4F"           # Black (Host)
export COLOR_02="#AF4B57"           # Red (Syntax string)
export COLOR_03="#AFD383"           # Green (Command)
export COLOR_04="#E5C079"           # Yellow (Command second)
export COLOR_05="#7D90A4"           # Blue (Path)
export COLOR_06="#A4799D"           # Magenta (Syntax var)
export COLOR_07="#85A6A5"           # Cyan (Prompt)
export COLOR_08="#EEEDEE"           # White

export COLOR_09="#7B7B7B"           # Bright Black
export COLOR_10="#AF4B57"           # Bright Red (Command error)
export COLOR_11="#CEFFAB"           # Bright Green (Exec)
export COLOR_12="#FFFECC"           # Bright Yellow
export COLOR_13="#B5DCFE"           # Bright Blue (Folder)
export COLOR_14="#FB9BFE"           # Bright Magenta
export COLOR_15="#DFDFFD"           # Bright Cyan
export COLOR_16="#FEFFFE"           # Bright White

export BACKGROUND_COLOR="#1C1F27"   # Background
export FOREGROUND_COLOR="#979CAC"   # Foreground (Text)

export CURSOR_COLOR="#979CAC" # Cursor

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
