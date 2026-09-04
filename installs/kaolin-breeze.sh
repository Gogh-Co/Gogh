#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Breeze"

export COLOR_01="#383E3F"           # Black (Host)
export COLOR_02="#CD5C60"           # Red (Syntax string)
export COLOR_03="#39855F"           # Green (Command)
export COLOR_04="#B87E3C"           # Yellow (Command second)
export COLOR_05="#2683B5"           # Blue (Path)
export COLOR_06="#845A84"           # Magenta (Syntax var)
export COLOR_07="#48A9A9"           # Cyan (Prompt)
export COLOR_08="#C9C2BD"           # White

export COLOR_09="#7D8468"           # Bright Black
export COLOR_10="#EF6787"           # Bright Red (Command error)
export COLOR_11="#3E594E"           # Bright Green (Exec)
export COLOR_12="#D1832E"           # Bright Yellow
export COLOR_13="#4F9CB8"           # Bright Blue (Folder)
export COLOR_14="#605DB3"           # Bright Magenta
export COLOR_15="#008B8B"           # Bright Cyan
export COLOR_16="#60696B"           # Bright White

export BACKGROUND_COLOR="#EBE8E4"   # Background
export FOREGROUND_COLOR="#383E3F"   # Foreground (Text)

export CURSOR_COLOR="#383E3F" # Cursor

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
