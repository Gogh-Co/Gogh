#!/usr/bin/env bash

export PROFILE_NAME="Kanagawa Wave"

export COLOR_01="#090618"           # Black (Host)
export COLOR_02="#C34043"           # Red (Syntax string)
export COLOR_03="#76946A"           # Green (Command)
export COLOR_04="#C0A36E"           # Yellow (Command second)
export COLOR_05="#7E9CD8"           # Blue (Path)
export COLOR_06="#957FB8"           # Magenta (Syntax var)
export COLOR_07="#6A9589"           # Cyan (Prompt)
export COLOR_08="#C8C093"           # White

export COLOR_09="#727169"           # Bright Black
export COLOR_10="#E82424"           # Bright Red (Command error)
export COLOR_11="#98BB6C"           # Bright Green (Exec)
export COLOR_12="#E6C384"           # Bright Yellow
export COLOR_13="#7FB4CA"           # Bright Blue (Folder)
export COLOR_14="#938AA9"           # Bright Magenta
export COLOR_15="#7AA89F"           # Bright Cyan
export COLOR_16="#DCD7BA"           # Bright White

export BACKGROUND_COLOR="#1F1F28"   # Background
export FOREGROUND_COLOR="#DCD7BA"   # Foreground (Text)

export CURSOR_COLOR="#DCD7BA" # Cursor

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
