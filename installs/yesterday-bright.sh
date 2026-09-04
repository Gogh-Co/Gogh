#!/usr/bin/env bash

export PROFILE_NAME="Yesterday Bright"

export COLOR_01="#343D46"           # Black (Host)
export COLOR_02="#D54E53"           # Red (Syntax string)
export COLOR_03="#B9CA4A"           # Green (Command)
export COLOR_04="#E7C547"           # Yellow (Command second)
export COLOR_05="#7AA6DA"           # Blue (Path)
export COLOR_06="#C397D8"           # Magenta (Syntax var)
export COLOR_07="#70C0B1"           # Cyan (Prompt)
export COLOR_08="#DFE1E8"           # White

export COLOR_09="#A7ADBA"           # Bright Black
export COLOR_10="#D54E53"           # Bright Red (Command error)
export COLOR_11="#B9CA4A"           # Bright Green (Exec)
export COLOR_12="#E7C547"           # Bright Yellow
export COLOR_13="#7AA6DA"           # Bright Blue (Folder)
export COLOR_14="#C397D8"           # Bright Magenta
export COLOR_15="#70C0B1"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#343D46"   # Background
export FOREGROUND_COLOR="#DFE1E8"   # Foreground (Text)

export CURSOR_COLOR="#DFE1E8" # Cursor

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
