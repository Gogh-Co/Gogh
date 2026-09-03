#!/usr/bin/env bash

export PROFILE_NAME="Zenburn Lost"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#CC9393"           # Red (Syntax string)
export COLOR_03="#EFEF87"           # Green (Command)
export COLOR_04="#FFD7A7"           # Yellow (Command second)
export COLOR_05="#C3BF97"           # Blue (Path)
export COLOR_06="#BCA3A3"           # Magenta (Syntax var)
export COLOR_07="#93B3A3"           # Cyan (Prompt)
export COLOR_08="#F0EFD0"           # White

export COLOR_09="#757575"           # Bright Black
export COLOR_10="#DFAF87"           # Bright Red (Command error)
export COLOR_11="#FFFF87"           # Bright Green (Exec)
export COLOR_12="#FFCFAF"           # Bright Yellow
export COLOR_13="#D7D7AF"           # Bright Blue (Folder)
export COLOR_14="#D7AFAF"           # Bright Magenta
export COLOR_15="#93BEA3"           # Bright Cyan
export COLOR_16="#DCDCCC"           # Bright White

export BACKGROUND_COLOR="#3A3A3A"   # Background
export FOREGROUND_COLOR="#DCDCCC"   # Foreground (Text)

export CURSOR_COLOR="#DCDCCC" # Cursor

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
