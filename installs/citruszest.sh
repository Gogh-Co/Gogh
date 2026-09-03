#!/usr/bin/env bash

export PROFILE_NAME="Citruszest"

export COLOR_01="#404040"           # Black (Host)
export COLOR_02="#FF5454"           # Red (Syntax string)
export COLOR_03="#00CC7A"           # Green (Command)
export COLOR_04="#FFD400"           # Yellow (Command second)
export COLOR_05="#00BFFF"           # Blue (Path)
export COLOR_06="#FF90FE"           # Magenta (Syntax var)
export COLOR_07="#48D1CC"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#FF1A75"           # Bright Red (Command error)
export COLOR_11="#1AFFA3"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#33CFFF"           # Bright Blue (Folder)
export COLOR_14="#FFB2FE"           # Bright Magenta
export COLOR_15="#00FFF2"           # Bright Cyan
export COLOR_16="#F9F9F9"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#BFBFBF"   # Foreground (Text)

export CURSOR_COLOR="#666666" # Cursor

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
