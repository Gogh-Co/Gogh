#!/usr/bin/env bash

export PROFILE_NAME="Tube"

export COLOR_01="#231F20"           # Black (Host)
export COLOR_02="#EE2E24"           # Red (Syntax string)
export COLOR_03="#00853E"           # Green (Command)
export COLOR_04="#FFD204"           # Yellow (Command second)
export COLOR_05="#009DDC"           # Blue (Path)
export COLOR_06="#98005D"           # Magenta (Syntax var)
export COLOR_07="#85CEBC"           # Cyan (Prompt)
export COLOR_08="#D9D8D8"           # White

export COLOR_09="#737171"           # Bright Black
export COLOR_10="#EE2E24"           # Bright Red (Command error)
export COLOR_11="#00853E"           # Bright Green (Exec)
export COLOR_12="#FFD204"           # Bright Yellow
export COLOR_13="#009DDC"           # Bright Blue (Folder)
export COLOR_14="#98005D"           # Bright Magenta
export COLOR_15="#85CEBC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#231F20"   # Background
export FOREGROUND_COLOR="#D9D8D8"   # Foreground (Text)

export CURSOR_COLOR="#D9D8D8" # Cursor

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
