#!/usr/bin/env bash

export PROFILE_NAME="Ayu Light"

export COLOR_01="#575F66"           # Black (Host)
export COLOR_02="#F51818"           # Red (Syntax string)
export COLOR_03="#86B300"           # Green (Command)
export COLOR_04="#F2AE49"           # Yellow (Command second)
export COLOR_05="#399EE6"           # Blue (Path)
export COLOR_06="#A37ACC"           # Magenta (Syntax var)
export COLOR_07="#4CBF99"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#8A9199"           # Bright Black
export COLOR_10="#F51818"           # Bright Red (Command error)
export COLOR_11="#86B300"           # Bright Green (Exec)
export COLOR_12="#F2AE49"           # Bright Yellow
export COLOR_13="#399EE6"           # Bright Blue (Folder)
export COLOR_14="#A37ACC"           # Bright Magenta
export COLOR_15="#4CBF99"           # Bright Cyan
export COLOR_16="#FAFAFA"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#575F66"   # Foreground (Text)

export CURSOR_COLOR="#FF9940" # Cursor

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
