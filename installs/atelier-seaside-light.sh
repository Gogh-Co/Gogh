#!/usr/bin/env bash

export PROFILE_NAME="Atelier Seaside Light"

export COLOR_01="#F4FBF4"           # Black (Host)
export COLOR_02="#E6193C"           # Red (Syntax string)
export COLOR_03="#29A329"           # Green (Command)
export COLOR_04="#98981B"           # Yellow (Command second)
export COLOR_05="#3D62F5"           # Blue (Path)
export COLOR_06="#AD2BEE"           # Magenta (Syntax var)
export COLOR_07="#1999B3"           # Cyan (Prompt)
export COLOR_08="#5E6E5E"           # White

export COLOR_09="#809980"           # Bright Black
export COLOR_10="#E6193C"           # Bright Red (Command error)
export COLOR_11="#29A329"           # Bright Green (Exec)
export COLOR_12="#98981B"           # Bright Yellow
export COLOR_13="#3D62F5"           # Bright Blue (Folder)
export COLOR_14="#AD2BEE"           # Bright Magenta
export COLOR_15="#1999B3"           # Bright Cyan
export COLOR_16="#131513"           # Bright White

export BACKGROUND_COLOR="#F4FBF4"   # Background
export FOREGROUND_COLOR="#5E6E5E"   # Foreground (Text)

export CURSOR_COLOR="#5E6E5E" # Cursor

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
