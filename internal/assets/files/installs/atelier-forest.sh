#!/usr/bin/env bash

export PROFILE_NAME="Atelier Forest"

export COLOR_01="#1B1918"           # Black (Host)
export COLOR_02="#F22C40"           # Red (Syntax string)
export COLOR_03="#7B9726"           # Green (Command)
export COLOR_04="#C38418"           # Yellow (Command second)
export COLOR_05="#407EE7"           # Blue (Path)
export COLOR_06="#6666EA"           # Magenta (Syntax var)
export COLOR_07="#3D97B8"           # Cyan (Prompt)
export COLOR_08="#A8A19F"           # White

export COLOR_09="#766E6B"           # Bright Black
export COLOR_10="#DF5320"           # Bright Red (Command error)
export COLOR_11="#7B9726"           # Bright Green (Exec)
export COLOR_12="#C38418"           # Bright Yellow
export COLOR_13="#407EE7"           # Bright Blue (Folder)
export COLOR_14="#6666EA"           # Bright Magenta
export COLOR_15="#3D97B8"           # Bright Cyan
export COLOR_16="#F1EFEE"           # Bright White

export BACKGROUND_COLOR="#1B1918"   # Background
export FOREGROUND_COLOR="#9C9491"   # Foreground (Text)

export CURSOR_COLOR="#9C9491" # Cursor

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
