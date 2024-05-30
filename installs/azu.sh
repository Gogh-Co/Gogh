#!/usr/bin/env bash

export PROFILE_NAME="Azu"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#AC6D74"           # Red (Syntax string)
export COLOR_03="#74AC6D"           # Green (Command)
export COLOR_04="#ACA46D"           # Yellow (Command second)
export COLOR_05="#6D74AC"           # Blue (Path)
export COLOR_06="#A46DAC"           # Magenta (Syntax var)
export COLOR_07="#6DACA4"           # Cyan (Prompt)
export COLOR_08="#E6E6E6"           # White

export COLOR_09="#262626"           # Bright Black
export COLOR_10="#D6B8BC"           # Bright Red (Command error)
export COLOR_11="#BCD6B8"           # Bright Green (Exec)
export COLOR_12="#D6D3B8"           # Bright Yellow
export COLOR_13="#B8BCD6"           # Bright Blue (Folder)
export COLOR_14="#D3B8D6"           # Bright Magenta
export COLOR_15="#B8D6D3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#09111A"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
