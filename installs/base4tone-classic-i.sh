#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic I"

export COLOR_01="#1D201D"           # Black (Host)
export COLOR_02="#5C6FEB"           # Red (Syntax string)
export COLOR_03="#91A404"           # Green (Command)
export COLOR_04="#C5DC18"           # Yellow (Command second)
export COLOR_05="#24CC38"           # Blue (Path)
export COLOR_06="#23B4C7"           # Magenta (Syntax var)
export COLOR_07="#ADC115"           # Cyan (Prompt)
export COLOR_08="#E8EDE9"           # White

export COLOR_09="#080D08"           # Bright Black
export COLOR_10="#929FF7"           # Bright Red (Command error)
export COLOR_11="#CEE61A"           # Bright Green (Exec)
export COLOR_12="#E6F28C"           # Bright Yellow
export COLOR_13="#B5F2BC"           # Bright Blue (Folder)
export COLOR_14="#3CCADD"           # Bright Magenta
export COLOR_15="#97EDA1"           # Bright Cyan
export COLOR_16="#F6F9F6"           # Bright White

export BACKGROUND_COLOR="#1D201D"   # Background
export FOREGROUND_COLOR="#949E95"   # Foreground (Text)

export CURSOR_COLOR="#83856F" # Cursor

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
