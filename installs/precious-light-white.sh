#!/usr/bin/env bash

export PROFILE_NAME="Precious Light White"

export COLOR_01="#FFFFFF"           # Black (Host)
export COLOR_02="#AF4947"           # Red (Syntax string)
export COLOR_03="#557301"           # Green (Command)
export COLOR_04="#876500"           # Yellow (Command second)
export COLOR_05="#186DAA"           # Blue (Path)
export COLOR_06="#7B4ECB"           # Magenta (Syntax var)
export COLOR_07="#087767"           # Cyan (Prompt)
export COLOR_08="#555555"           # White

export COLOR_09="#848484"           # Bright Black
export COLOR_10="#AF4947"           # Bright Red (Command error)
export COLOR_11="#557301"           # Bright Green (Exec)
export COLOR_12="#876500"           # Bright Yellow
export COLOR_13="#186DAA"           # Bright Blue (Folder)
export COLOR_14="#7B4ECB"           # Bright Magenta
export COLOR_15="#087767"           # Bright Cyan
export COLOR_16="#555555"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#555555"   # Foreground (Text)

export CURSOR_COLOR="#555555" # Cursor

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
