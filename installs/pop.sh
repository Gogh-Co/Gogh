#!/usr/bin/env bash

export PROFILE_NAME="Pop"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EB008A"           # Red (Syntax string)
export COLOR_03="#37B349"           # Green (Command)
export COLOR_04="#F8CA12"           # Yellow (Command second)
export COLOR_05="#0E5A94"           # Blue (Path)
export COLOR_06="#B31E8D"           # Magenta (Syntax var)
export COLOR_07="#00AABB"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#EB008A"           # Bright Red (Command error)
export COLOR_11="#37B349"           # Bright Green (Exec)
export COLOR_12="#F8CA12"           # Bright Yellow
export COLOR_13="#0E5A94"           # Bright Blue (Folder)
export COLOR_14="#B31E8D"           # Bright Magenta
export COLOR_15="#00AABB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
