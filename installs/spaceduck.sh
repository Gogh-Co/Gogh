#!/usr/bin/env bash

export PROFILE_NAME="Spaceduck"

export COLOR_01="#16172D"           # Black (Host)
export COLOR_02="#E33400"           # Red (Syntax string)
export COLOR_03="#5CCC96"           # Green (Command)
export COLOR_04="#F2CE00"           # Yellow (Command second)
export COLOR_05="#7A5CCC"           # Blue (Path)
export COLOR_06="#B3A1E6"           # Magenta (Syntax var)
export COLOR_07="#00A3CC"           # Cyan (Prompt)
export COLOR_08="#ECF0C1"           # White

export COLOR_09="#686F9A"           # Bright Black
export COLOR_10="#E33400"           # Bright Red (Command error)
export COLOR_11="#5CCC96"           # Bright Green (Exec)
export COLOR_12="#F2CE00"           # Bright Yellow
export COLOR_13="#7A5CCC"           # Bright Blue (Folder)
export COLOR_14="#B3A1E6"           # Bright Magenta
export COLOR_15="#00A3CC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#16172D"   # Background
export FOREGROUND_COLOR="#ECF0C1"   # Foreground (Text)

export CURSOR_COLOR="#ECF0C1" # Cursor

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
