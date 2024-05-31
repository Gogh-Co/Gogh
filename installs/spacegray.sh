#!/usr/bin/env bash

export PROFILE_NAME="Spacegray"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B04B57"           # Red (Syntax string)
export COLOR_03="#87B379"           # Green (Command)
export COLOR_04="#E5C179"           # Yellow (Command second)
export COLOR_05="#7D8FA4"           # Blue (Path)
export COLOR_06="#A47996"           # Magenta (Syntax var)
export COLOR_07="#85A7A5"           # Cyan (Prompt)
export COLOR_08="#B3B8C3"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#B04B57"           # Bright Red (Command error)
export COLOR_11="#87B379"           # Bright Green (Exec)
export COLOR_12="#E5C179"           # Bright Yellow
export COLOR_13="#7D8FA4"           # Bright Blue (Folder)
export COLOR_14="#A47996"           # Bright Magenta
export COLOR_15="#85A7A5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#20242D"   # Background
export FOREGROUND_COLOR="#B3B8C3"   # Foreground (Text)

export CURSOR_COLOR="#B3B8C3" # Cursor

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
