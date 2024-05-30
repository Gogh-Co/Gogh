#!/usr/bin/env bash

export PROFILE_NAME="Frontend Fun Forrest"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D6262B"           # Red (Syntax string)
export COLOR_03="#919C00"           # Green (Command)
export COLOR_04="#BE8A13"           # Yellow (Command second)
export COLOR_05="#4699A3"           # Blue (Path)
export COLOR_06="#8D4331"           # Magenta (Syntax var)
export COLOR_07="#DA8213"           # Cyan (Prompt)
export COLOR_08="#DDC265"           # White

export COLOR_09="#7F6A55"           # Bright Black
export COLOR_10="#E55A1C"           # Bright Red (Command error)
export COLOR_11="#BFC65A"           # Bright Green (Exec)
export COLOR_12="#FFCB1B"           # Bright Yellow
export COLOR_13="#7CC9CF"           # Bright Blue (Folder)
export COLOR_14="#D26349"           # Bright Magenta
export COLOR_15="#E6A96B"           # Bright Cyan
export COLOR_16="#FFEAA3"           # Bright White

export BACKGROUND_COLOR="#251200"   # Background
export FOREGROUND_COLOR="#DEC165"   # Foreground (Text)

export CURSOR_COLOR="#DEC165" # Cursor

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
