#!/usr/bin/env bash

export PROFILE_NAME="Horizon Terminal Light"

export COLOR_01="#FDF0ED"           # Black (Host)
export COLOR_02="#E95678"           # Red (Syntax string)
export COLOR_03="#29D398"           # Green (Command)
export COLOR_04="#FADAD1"           # Yellow (Command second)
export COLOR_05="#26BBD9"           # Blue (Path)
export COLOR_06="#EE64AC"           # Magenta (Syntax var)
export COLOR_07="#59E1E3"           # Cyan (Prompt)
export COLOR_08="#403C3D"           # White

export COLOR_09="#BDB3B1"           # Bright Black
export COLOR_10="#E95678"           # Bright Red (Command error)
export COLOR_11="#29D398"           # Bright Green (Exec)
export COLOR_12="#FADAD1"           # Bright Yellow
export COLOR_13="#26BBD9"           # Bright Blue (Folder)
export COLOR_14="#EE64AC"           # Bright Magenta
export COLOR_15="#59E1E3"           # Bright Cyan
export COLOR_16="#201C1D"           # Bright White

export BACKGROUND_COLOR="#FDF0ED"   # Background
export FOREGROUND_COLOR="#403C3D"   # Foreground (Text)

export CURSOR_COLOR="#403C3D" # Cursor

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
