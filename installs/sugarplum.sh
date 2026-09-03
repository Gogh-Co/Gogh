#!/usr/bin/env bash

export PROFILE_NAME="Sugarplum"

export COLOR_01="#111147"           # Black (Host)
export COLOR_02="#5CA8DC"           # Red (Syntax string)
export COLOR_03="#53B397"           # Green (Command)
export COLOR_04="#249A84"           # Yellow (Command second)
export COLOR_05="#DB7DDD"           # Blue (Path)
export COLOR_06="#D0BEEE"           # Magenta (Syntax var)
export COLOR_07="#F9F3F9"           # Cyan (Prompt)
export COLOR_08="#A175D4"           # White

export COLOR_09="#111147"           # Bright Black
export COLOR_10="#5CB5DC"           # Bright Red (Command error)
export COLOR_11="#52DEB5"           # Bright Green (Exec)
export COLOR_12="#01F5C7"           # Bright Yellow
export COLOR_13="#FA5DFD"           # Bright Blue (Folder)
export COLOR_14="#C6A5FD"           # Bright Magenta
export COLOR_15="#FFFFFF"           # Bright Cyan
export COLOR_16="#B577FD"           # Bright White

export BACKGROUND_COLOR="#111147"   # Background
export FOREGROUND_COLOR="#DB7DDD"   # Foreground (Text)

export CURSOR_COLOR="#53B397" # Cursor

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
