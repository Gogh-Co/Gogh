#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Material Dark Hard"

export COLOR_01="#202020"           # Black (Host)
export COLOR_02="#EA6962"           # Red (Syntax string)
export COLOR_03="#A9B665"           # Green (Command)
export COLOR_04="#D8A657"           # Yellow (Command second)
export COLOR_05="#7DAEA3"           # Blue (Path)
export COLOR_06="#D3869B"           # Magenta (Syntax var)
export COLOR_07="#89B482"           # Cyan (Prompt)
export COLOR_08="#DDC7A1"           # White

export COLOR_09="#5A524C"           # Bright Black
export COLOR_10="#EA6962"           # Bright Red (Command error)
export COLOR_11="#A9B665"           # Bright Green (Exec)
export COLOR_12="#D8A657"           # Bright Yellow
export COLOR_13="#7DAEA3"           # Bright Blue (Folder)
export COLOR_14="#D3869B"           # Bright Magenta
export COLOR_15="#89B482"           # Bright Cyan
export COLOR_16="#FBF1C7"           # Bright White

export BACKGROUND_COLOR="#202020"   # Background
export FOREGROUND_COLOR="#DDC7A1"   # Foreground (Text)

export CURSOR_COLOR="#DDC7A1" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
