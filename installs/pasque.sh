#!/usr/bin/env bash

export PROFILE_NAME="Pasque"

export COLOR_01="#271C3A"           # Black (Host)
export COLOR_02="#A92258"           # Red (Syntax string)
export COLOR_03="#C6914B"           # Green (Command)
export COLOR_04="#804EAD"           # Yellow (Command second)
export COLOR_05="#8E7DC6"           # Blue (Path)
export COLOR_06="#953B9D"           # Magenta (Syntax var)
export COLOR_07="#7263AA"           # Cyan (Prompt)
export COLOR_08="#DEDCDF"           # White

export COLOR_09="#5D5766"           # Bright Black
export COLOR_10="#A92258"           # Bright Red (Command error)
export COLOR_11="#C6914B"           # Bright Green (Exec)
export COLOR_12="#804EAD"           # Bright Yellow
export COLOR_13="#8E7DC6"           # Bright Blue (Folder)
export COLOR_14="#953B9D"           # Bright Magenta
export COLOR_15="#7263AA"           # Bright Cyan
export COLOR_16="#BBAADD"           # Bright White

export BACKGROUND_COLOR="#271C3A"   # Background
export FOREGROUND_COLOR="#DEDCDF"   # Foreground (Text)

export CURSOR_COLOR="#DEDCDF" # Cursor

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
