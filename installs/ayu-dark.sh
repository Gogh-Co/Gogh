#!/usr/bin/env bash

export PROFILE_NAME="Ayu Dark"

export COLOR_01="#0A0E14"           # Black (Host)
export COLOR_02="#FF3333"           # Red (Syntax string)
export COLOR_03="#C2D94C"           # Green (Command)
export COLOR_04="#FF8F40"           # Yellow (Command second)
export COLOR_05="#59C2FF"           # Blue (Path)
export COLOR_06="#FFEE99"           # Magenta (Syntax var)
export COLOR_07="#95E6CB"           # Cyan (Prompt)
export COLOR_08="#B3B1AD"           # White

export COLOR_09="#4D5566"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#C2D94C"           # Bright Green (Exec)
export COLOR_12="#FF8F40"           # Bright Yellow
export COLOR_13="#59C2FF"           # Bright Blue (Folder)
export COLOR_14="#FFEE99"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#B3B1AD"           # Bright White

export BACKGROUND_COLOR="#0A0E14"   # Background
export FOREGROUND_COLOR="#B3B1AD"   # Foreground (Text)

export CURSOR_COLOR="#E6B450" # Cursor

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
