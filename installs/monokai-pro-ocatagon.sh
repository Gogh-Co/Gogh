#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Ocatagon"

export COLOR_01="#3A3D4B"           # Black (Host)
export COLOR_02="#FF657A"           # Red (Syntax string)
export COLOR_03="#BAD761"           # Green (Command)
export COLOR_04="#FFD76D"           # Yellow (Command second)
export COLOR_05="#FF9B5E"           # Blue (Path)
export COLOR_06="#C39AC9"           # Magenta (Syntax var)
export COLOR_07="#9CD1BB"           # Cyan (Prompt)
export COLOR_08="#EAF2F1"           # White

export COLOR_09="#ADAEB4"           # Bright Black
export COLOR_10="#FF657A"           # Bright Red (Command error)
export COLOR_11="#BAD761"           # Bright Green (Exec)
export COLOR_12="#FFD76D"           # Bright Yellow
export COLOR_13="#FF9B5E"           # Bright Blue (Folder)
export COLOR_14="#C39AC9"           # Bright Magenta
export COLOR_15="#9CD1BB"           # Bright Cyan
export COLOR_16="#EAF2F1"           # Bright White

export BACKGROUND_COLOR="#3A3D4B"   # Background
export FOREGROUND_COLOR="#EAF2F1"   # Foreground (Text)

export CURSOR_COLOR="#EAF2F1" # Cursor

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
