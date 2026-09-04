#!/usr/bin/env bash

export PROFILE_NAME="Renault Style Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DA4839"           # Red (Syntax string)
export COLOR_03="#509F50"           # Green (Command)
export COLOR_04="#FFD249"           # Yellow (Command second)
export COLOR_05="#46657D"           # Blue (Path)
export COLOR_06="#CFCFFF"           # Magenta (Syntax var)
export COLOR_07="#87C1F1"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#FF7B6A"           # Bright Red (Command error)
export COLOR_11="#83D082"           # Bright Green (Exec)
export COLOR_12="#FFFF7B"           # Bright Yellow
export COLOR_13="#9FCEF0"           # Bright Blue (Folder)
export COLOR_14="#FFFFFF"           # Bright Magenta
export COLOR_15="#A4D4F8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#3A3A3A"   # Background
export FOREGROUND_COLOR="#E9CB7B"   # Foreground (Text)

export CURSOR_COLOR="#E9CB7B" # Cursor

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
