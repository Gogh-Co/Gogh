#!/usr/bin/env bash

export PROFILE_NAME="City Lights"

export COLOR_01="#41505E"           # Black (Host)
export COLOR_02="#D95468"           # Red (Syntax string)
export COLOR_03="#8BD49C"           # Green (Command)
export COLOR_04="#EBBF83"           # Yellow (Command second)
export COLOR_05="#539AFC"           # Blue (Path)
export COLOR_06="#B62D65"           # Magenta (Syntax var)
export COLOR_07="#70E1E8"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#41505E"           # Bright Black
export COLOR_10="#D95468"           # Bright Red (Command error)
export COLOR_11="#8BD49C"           # Bright Green (Exec)
export COLOR_12="#EBBF83"           # Bright Yellow
export COLOR_13="#539AFC"           # Bright Blue (Folder)
export COLOR_14="#B62D65"           # Bright Magenta
export COLOR_15="#70E1E8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#171D23"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#008B94" # Cursor

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
