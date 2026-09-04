#!/usr/bin/env bash

export PROFILE_NAME="Alucard"

export COLOR_01="#FFFBEB"           # Black (Host)
export COLOR_02="#CB3A2A"           # Red (Syntax string)
export COLOR_03="#14710A"           # Green (Command)
export COLOR_04="#846E15"           # Yellow (Command second)
export COLOR_05="#644AC9"           # Blue (Path)
export COLOR_06="#A3144D"           # Magenta (Syntax var)
export COLOR_07="#036A96"           # Cyan (Prompt)
export COLOR_08="#1F1F1F"           # White

export COLOR_09="#6C664B"           # Bright Black
export COLOR_10="#D74C3D"           # Bright Red (Command error)
export COLOR_11="#198D0C"           # Bright Green (Exec)
export COLOR_12="#9E841A"           # Bright Yellow
export COLOR_13="#7862D0"           # Bright Blue (Folder)
export COLOR_14="#BF185A"           # Bright Magenta
export COLOR_15="#047FB4"           # Bright Cyan
export COLOR_16="#2C2B31"           # Bright White

export BACKGROUND_COLOR="#FFFBEB"   # Background
export FOREGROUND_COLOR="#1F1F1F"   # Foreground (Text)

export CURSOR_COLOR="#1F1F1F" # Cursor

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
