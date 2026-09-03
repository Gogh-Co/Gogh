#!/usr/bin/env bash

export PROFILE_NAME="Apple System Colors Light"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#BC4437"           # Red (Syntax string)
export COLOR_03="#51A148"           # Green (Command)
export COLOR_04="#C7AD3A"           # Yellow (Command second)
export COLOR_05="#2E68C5"           # Blue (Path)
export COLOR_06="#8C4BB8"           # Magenta (Syntax var)
export COLOR_07="#5E9CBE"           # Cyan (Prompt)
export COLOR_08="#98989D"           # White

export COLOR_09="#464646"           # Bright Black
export COLOR_10="#EB5545"           # Bright Red (Command error)
export COLOR_11="#6BD45F"           # Bright Green (Exec)
export COLOR_12="#F8D84A"           # Bright Yellow
export COLOR_13="#3B82F7"           # Bright Blue (Folder)
export COLOR_14="#B260EA"           # Bright Magenta
export COLOR_15="#8DD3FB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FEFFFF"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#98989D" # Cursor

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
