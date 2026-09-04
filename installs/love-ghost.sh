#!/usr/bin/env bash

export PROFILE_NAME="Love Ghost"

export COLOR_01="#C0B4B8"           # Black (Host)
export COLOR_02="#806068"           # Red (Syntax string)
export COLOR_03="#485848"           # Green (Command)
export COLOR_04="#604838"           # Yellow (Command second)
export COLOR_05="#484058"           # Blue (Path)
export COLOR_06="#603848"           # Magenta (Syntax var)
export COLOR_07="#385050"           # Cyan (Prompt)
export COLOR_08="#B0A8A4"           # White

export COLOR_09="#3A2830"           # Bright Black
export COLOR_10="#987078"           # Bright Red (Command error)
export COLOR_11="#586858"           # Bright Green (Exec)
export COLOR_12="#705848"           # Bright Yellow
export COLOR_13="#585068"           # Bright Blue (Folder)
export COLOR_14="#704858"           # Bright Magenta
export COLOR_15="#486060"           # Bright Cyan
export COLOR_16="#C8C0BC"           # Bright White

export BACKGROUND_COLOR="#EBE5E6"   # Background
export FOREGROUND_COLOR="#3A2830"   # Foreground (Text)

export CURSOR_COLOR="#3A2830" # Cursor

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
