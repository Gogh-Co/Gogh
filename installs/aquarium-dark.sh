#!/usr/bin/env bash

export PROFILE_NAME="Aquarium Dark"

export COLOR_01="#3B3B4D"           # Black (Host)
export COLOR_02="#EBB9B9"           # Red (Syntax string)
export COLOR_03="#CAF6BB"           # Green (Command)
export COLOR_04="#E6DFB8"           # Yellow (Command second)
export COLOR_05="#CDDBF9"           # Blue (Path)
export COLOR_06="#F6BBE7"           # Magenta (Syntax var)
export COLOR_07="#B8DCEB"           # Cyan (Prompt)
export COLOR_08="#C8CEDC"           # White

export COLOR_09="#1B1B23"           # Bright Black
export COLOR_10="#D95E59"           # Bright Red (Command error)
export COLOR_11="#8FC587"           # Bright Green (Exec)
export COLOR_12="#FFCF85"           # Bright Yellow
export COLOR_13="#4A83C3"           # Bright Blue (Folder)
export COLOR_14="#BF83B5"           # Bright Magenta
export COLOR_15="#4EB3CD"           # Bright Cyan
export COLOR_16="#ABB2C2"           # Bright White

export BACKGROUND_COLOR="#20202A"   # Background
export FOREGROUND_COLOR="#C6D0E9"   # Foreground (Text)

export CURSOR_COLOR="#C6D0E9" # Cursor

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
