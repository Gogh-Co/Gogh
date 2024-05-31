#!/usr/bin/env bash

export PROFILE_NAME="Smyck"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C75646"           # Red (Syntax string)
export COLOR_03="#8EB33B"           # Green (Command)
export COLOR_04="#D0B03C"           # Yellow (Command second)
export COLOR_05="#72B3CC"           # Blue (Path)
export COLOR_06="#C8A0D1"           # Magenta (Syntax var)
export COLOR_07="#218693"           # Cyan (Prompt)
export COLOR_08="#B0B0B0"           # White

export COLOR_09="#5D5D5D"           # Bright Black
export COLOR_10="#E09690"           # Bright Red (Command error)
export COLOR_11="#CDEE69"           # Bright Green (Exec)
export COLOR_12="#FFE377"           # Bright Yellow
export COLOR_13="#9CD9F0"           # Bright Blue (Folder)
export COLOR_14="#FBB1F9"           # Bright Magenta
export COLOR_15="#77DFD8"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#242424"   # Background
export FOREGROUND_COLOR="#F7F7F7"   # Foreground (Text)

export CURSOR_COLOR="#F7F7F7" # Cursor

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
