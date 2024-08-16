#!/usr/bin/env bash

export PROFILE_NAME="Atelier Sulphurpool"

export COLOR_01="#C94922"           # Black (Host)
export COLOR_02="#C94922"           # Red (Syntax string)
export COLOR_03="#AC9739"           # Green (Command)
export COLOR_04="#C08B30"           # Yellow (Command second)
export COLOR_05="#3D8FD1"           # Blue (Path)
export COLOR_06="#9C637A"           # Magenta (Syntax var)
export COLOR_07="#22A2C9"           # Cyan (Prompt)
export COLOR_08="#DFE2F1"           # White

export COLOR_09="#6B7394"           # Bright Black
export COLOR_10="#C76B29"           # Bright Red (Command error)
export COLOR_11="#AC9739"           # Bright Green (Exec)
export COLOR_12="#C08B30"           # Bright Yellow
export COLOR_13="#6679CC"           # Bright Blue (Folder)
export COLOR_14="#9C637A"           # Bright Magenta
export COLOR_15="#22A2C9"           # Bright Cyan
export COLOR_16="#F5F7FF"           # Bright White

export BACKGROUND_COLOR="#202746"   # Background
export FOREGROUND_COLOR="#898EA4"   # Foreground (Text)

export CURSOR_COLOR="#898EA4" # Cursor

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
