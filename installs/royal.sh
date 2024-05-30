#!/usr/bin/env bash

export PROFILE_NAME="Royal"

export COLOR_01="#241F2B"           # Black (Host)
export COLOR_02="#91284C"           # Red (Syntax string)
export COLOR_03="#23801C"           # Green (Command)
export COLOR_04="#B49D27"           # Yellow (Command second)
export COLOR_05="#6580B0"           # Blue (Path)
export COLOR_06="#674D96"           # Magenta (Syntax var)
export COLOR_07="#8AAABE"           # Cyan (Prompt)
export COLOR_08="#524966"           # White

export COLOR_09="#312D3D"           # Bright Black
export COLOR_10="#D5356C"           # Bright Red (Command error)
export COLOR_11="#2CD946"           # Bright Green (Exec)
export COLOR_12="#FDE83B"           # Bright Yellow
export COLOR_13="#90BAF9"           # Bright Blue (Folder)
export COLOR_14="#A479E3"           # Bright Magenta
export COLOR_15="#ACD4EB"           # Bright Cyan
export COLOR_16="#9E8CBD"           # Bright White

export BACKGROUND_COLOR="#100815"   # Background
export FOREGROUND_COLOR="#514968"   # Foreground (Text)

export CURSOR_COLOR="#514968" # Cursor

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
