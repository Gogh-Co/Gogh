#!/usr/bin/env bash

export PROFILE_NAME="Fairyfloss"

export COLOR_01="#040303"           # Black (Host)
export COLOR_02="#F92672"           # Red (Syntax string)
export COLOR_03="#C2FFDF"           # Green (Command)
export COLOR_04="#E6C000"           # Yellow (Command second)
export COLOR_05="#C2FFDF"           # Blue (Path)
export COLOR_06="#FFB8D1"           # Magenta (Syntax var)
export COLOR_07="#C5A3FF"           # Cyan (Prompt)
export COLOR_08="#F8F8F0"           # White

export COLOR_09="#6090CB"           # Bright Black
export COLOR_10="#FF857F"           # Bright Red (Command error)
export COLOR_11="#C2FFDF"           # Bright Green (Exec)
export COLOR_12="#FFEA00"           # Bright Yellow
export COLOR_13="#C2FFDF"           # Bright Blue (Folder)
export COLOR_14="#FFB8D1"           # Bright Magenta
export COLOR_15="#C5A3FF"           # Bright Cyan
export COLOR_16="#F8F8F0"           # Bright White

export BACKGROUND_COLOR="#5A5475"   # Background
export FOREGROUND_COLOR="#F8F8F2"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F0" # Cursor

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
