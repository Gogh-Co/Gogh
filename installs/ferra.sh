#!/usr/bin/env bash

export PROFILE_NAME="Ferra"

export COLOR_01="#1F1E20"           # Black (Host)
export COLOR_02="#C05862"           # Red (Syntax string)
export COLOR_03="#8E9478"           # Green (Command)
export COLOR_04="#FFA07A"           # Yellow (Command second)
export COLOR_05="#BFBFCF"           # Blue (Path)
export COLOR_06="#F6B6C9"           # Magenta (Syntax var)
export COLOR_07="#8EB5B0"           # Cyan (Prompt)
export COLOR_08="#D8D4D6"           # White

export COLOR_09="#6F5D63"           # Bright Black
export COLOR_10="#E06B75"           # Bright Red (Command error)
export COLOR_11="#B1B695"           # Bright Green (Exec)
export COLOR_12="#B8864E"           # Bright Yellow
export COLOR_13="#D1D1E0"           # Bright Blue (Folder)
export COLOR_14="#E8829C"           # Bright Magenta
export COLOR_15="#AACDC8"           # Bright Cyan
export COLOR_16="#E4E0E2"           # Bright White

export BACKGROUND_COLOR="#2B292D"   # Background
export FOREGROUND_COLOR="#FECDB2"   # Foreground (Text)

export CURSOR_COLOR="#FECDB2" # Cursor

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
