#!/usr/bin/env bash

export PROFILE_NAME="Eclipse"

export COLOR_01="#0A0D12"           # Black (Host)
export COLOR_02="#FF6366"           # Red (Syntax string)
export COLOR_03="#85DF5E"           # Green (Command)
export COLOR_04="#F1C655"           # Yellow (Command second)
export COLOR_05="#5FB9FF"           # Blue (Path)
export COLOR_06="#CEA5FF"           # Magenta (Syntax var)
export COLOR_07="#3ADDC4"           # Cyan (Prompt)
export COLOR_08="#B7C0CE"           # White

export COLOR_09="#5C6675"           # Bright Black
export COLOR_10="#FF8688"           # Bright Red (Command error)
export COLOR_11="#A0EC7E"           # Bright Green (Exec)
export COLOR_12="#FAD77C"           # Bright Yellow
export COLOR_13="#84CCFF"           # Bright Blue (Folder)
export COLOR_14="#DDBFFF"           # Bright Magenta
export COLOR_15="#68EAD3"           # Bright Cyan
export COLOR_16="#F4F8FD"           # Bright White

export BACKGROUND_COLOR="#0E1116"   # Background
export FOREGROUND_COLOR="#DCE3ED"   # Foreground (Text)

export CURSOR_COLOR="#F6C45F" # Cursor

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
