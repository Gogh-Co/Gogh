#!/usr/bin/env bash

export PROFILE_NAME="Gruvbox Material Dark"

export COLOR_01="#3C3836"           # Black (Host)
export COLOR_02="#EA6962"           # Red (Syntax string)
export COLOR_03="#A9B665"           # Green (Command)
export COLOR_04="#D8A657"           # Yellow (Command second)
export COLOR_05="#7DAEA3"           # Blue (Path)
export COLOR_06="#D3869B"           # Magenta (Syntax var)
export COLOR_07="#89B482"           # Cyan (Prompt)
export COLOR_08="#D4BE98"           # White

export COLOR_09="#3C3836"           # Bright Black
export COLOR_10="#EA6962"           # Bright Red (Command error)
export COLOR_11="#A9B665"           # Bright Green (Exec)
export COLOR_12="#D8A657"           # Bright Yellow
export COLOR_13="#7DAEA3"           # Bright Blue (Folder)
export COLOR_14="#D3869B"           # Bright Magenta
export COLOR_15="#89B482"           # Bright Cyan
export COLOR_16="#D4BE98"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#D4BE98"   # Foreground (Text)

export CURSOR_COLOR="#D4BE98" # Cursor

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
