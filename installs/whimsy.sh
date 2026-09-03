#!/usr/bin/env bash

export PROFILE_NAME="Whimsy"

export COLOR_01="#535178"           # Black (Host)
export COLOR_02="#EF6487"           # Red (Syntax string)
export COLOR_03="#5ECA89"           # Green (Command)
export COLOR_04="#FDD877"           # Yellow (Command second)
export COLOR_05="#65AEF7"           # Blue (Path)
export COLOR_06="#AA7FF0"           # Magenta (Syntax var)
export COLOR_07="#43C1BE"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#535178"           # Bright Black
export COLOR_10="#EF6487"           # Bright Red (Command error)
export COLOR_11="#5ECA89"           # Bright Green (Exec)
export COLOR_12="#FDD877"           # Bright Yellow
export COLOR_13="#65AEF7"           # Bright Blue (Folder)
export COLOR_14="#AA7FF0"           # Bright Magenta
export COLOR_15="#43C1BE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#29283B"   # Background
export FOREGROUND_COLOR="#B3B0D6"   # Foreground (Text)

export CURSOR_COLOR="#B3B0D6" # Cursor

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
