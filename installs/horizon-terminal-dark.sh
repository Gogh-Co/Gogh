#!/usr/bin/env bash

export PROFILE_NAME="Horizon Terminal Dark"

export COLOR_01="#1C1E26"           # Black (Host)
export COLOR_02="#E95678"           # Red (Syntax string)
export COLOR_03="#29D398"           # Green (Command)
export COLOR_04="#FAC29A"           # Yellow (Command second)
export COLOR_05="#26BBD9"           # Blue (Path)
export COLOR_06="#EE64AC"           # Magenta (Syntax var)
export COLOR_07="#59E1E3"           # Cyan (Prompt)
export COLOR_08="#CBCED0"           # White

export COLOR_09="#6F6F70"           # Bright Black
export COLOR_10="#E95678"           # Bright Red (Command error)
export COLOR_11="#29D398"           # Bright Green (Exec)
export COLOR_12="#FAC29A"           # Bright Yellow
export COLOR_13="#26BBD9"           # Bright Blue (Folder)
export COLOR_14="#EE64AC"           # Bright Magenta
export COLOR_15="#59E1E3"           # Bright Cyan
export COLOR_16="#E3E6EE"           # Bright White

export BACKGROUND_COLOR="#1C1E26"   # Background
export FOREGROUND_COLOR="#CBCED0"   # Foreground (Text)

export CURSOR_COLOR="#CBCED0" # Cursor

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
