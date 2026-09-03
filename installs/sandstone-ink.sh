#!/usr/bin/env bash

export PROFILE_NAME="Sandstone Ink"

export COLOR_01="#002B36"           # Black (Host)
export COLOR_02="#CF2522"           # Red (Syntax string)
export COLOR_03="#4B7000"           # Green (Command)
export COLOR_04="#906800"           # Yellow (Command second)
export COLOR_05="#0D6FA8"           # Blue (Path)
export COLOR_06="#B5006E"           # Magenta (Syntax var)
export COLOR_07="#00756D"           # Cyan (Prompt)
export COLOR_08="#6E6855"           # White

export COLOR_09="#2B3D45"           # Bright Black
export COLOR_10="#B33000"           # Bright Red (Command error)
export COLOR_11="#536868"           # Bright Green (Exec)
export COLOR_12="#566C6C"           # Bright Yellow
export COLOR_13="#5C6F6F"           # Bright Blue (Folder)
export COLOR_14="#5F64B7"           # Bright Magenta
export COLOR_15="#5F6E6E"           # Bright Cyan
export COLOR_16="#FDF6E3"           # Bright White

export BACKGROUND_COLOR="#FDF6E3"   # Background
export FOREGROUND_COLOR="#2B3D45"   # Foreground (Text)

export CURSOR_COLOR="#2B3D45" # Cursor

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
