#!/usr/bin/env bash

export PROFILE_NAME="Hemisu Light"

export COLOR_01="#777777"           # Black (Host)
export COLOR_02="#FF0055"           # Red (Syntax string)
export COLOR_03="#739100"           # Green (Command)
export COLOR_04="#503D15"           # Yellow (Command second)
export COLOR_05="#538091"           # Blue (Path)
export COLOR_06="#5B345E"           # Magenta (Syntax var)
export COLOR_07="#538091"           # Cyan (Prompt)
export COLOR_08="#999999"           # White

export COLOR_09="#999999"           # Bright Black
export COLOR_10="#D65E76"           # Bright Red (Command error)
export COLOR_11="#9CC700"           # Bright Green (Exec)
export COLOR_12="#947555"           # Bright Yellow
export COLOR_13="#9DB3CD"           # Bright Blue (Folder)
export COLOR_14="#A184A4"           # Bright Magenta
export COLOR_15="#85B2AA"           # Bright Cyan
export COLOR_16="#BABABA"           # Bright White

export BACKGROUND_COLOR="#EFEFEF"   # Background
export FOREGROUND_COLOR="#444444"   # Foreground (Text)

export CURSOR_COLOR="#FF0054" # Cursor

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
