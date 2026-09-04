#!/usr/bin/env bash

export PROFILE_NAME="Bright"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FB0120"           # Red (Syntax string)
export COLOR_03="#A1C659"           # Green (Command)
export COLOR_04="#FDA331"           # Yellow (Command second)
export COLOR_05="#6FB3D2"           # Blue (Path)
export COLOR_06="#D381C3"           # Magenta (Syntax var)
export COLOR_07="#76C7B7"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#B0B0B0"           # Bright Black
export COLOR_10="#FB0120"           # Bright Red (Command error)
export COLOR_11="#A1C659"           # Bright Green (Exec)
export COLOR_12="#FDA331"           # Bright Yellow
export COLOR_13="#6FB3D2"           # Bright Blue (Folder)
export COLOR_14="#D381C3"           # Bright Magenta
export COLOR_15="#76C7B7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#E0E0E0"   # Foreground (Text)

export CURSOR_COLOR="#E0E0E0" # Cursor

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
