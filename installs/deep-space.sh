#!/usr/bin/env bash

export PROFILE_NAME="Deep Space"

export COLOR_01="#1B202A"           # Black (Host)
export COLOR_02="#B15E7C"           # Red (Syntax string)
export COLOR_03="#709D6C"           # Green (Command)
export COLOR_04="#B5A262"           # Yellow (Command second)
export COLOR_05="#608CC3"           # Blue (Path)
export COLOR_06="#8F72BF"           # Magenta (Syntax var)
export COLOR_07="#56ADB7"           # Cyan (Prompt)
export COLOR_08="#9AA7BD"           # White

export COLOR_09="#232936"           # Bright Black
export COLOR_10="#B3785D"           # Bright Red (Command error)
export COLOR_11="#709D6C"           # Bright Green (Exec)
export COLOR_12="#D5B875"           # Bright Yellow
export COLOR_13="#608CC3"           # Bright Blue (Folder)
export COLOR_14="#C47EBD"           # Bright Magenta
export COLOR_15="#51617D"           # Bright Cyan
export COLOR_16="#9AA7BD"           # Bright White

export BACKGROUND_COLOR="#1B202A"   # Background
export FOREGROUND_COLOR="#9AA7BD"   # Foreground (Text)

export CURSOR_COLOR="#9AA7BD" # Cursor

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
