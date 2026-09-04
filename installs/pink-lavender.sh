#!/usr/bin/env bash

export PROFILE_NAME="Pink Lavender"

export COLOR_01="#0C0611"           # Black (Host)
export COLOR_02="#B292AC"           # Red (Syntax string)
export COLOR_03="#C8A3BC"           # Green (Command)
export COLOR_04="#DAB2CC"           # Yellow (Command second)
export COLOR_05="#A697A0"           # Blue (Path)
export COLOR_06="#B292AC"           # Magenta (Syntax var)
export COLOR_07="#C8A3BC"           # Cyan (Prompt)
export COLOR_08="#DAB2CC"           # White

export COLOR_09="#90758D"           # Bright Black
export COLOR_10="#C29EB6"           # Bright Red (Command error)
export COLOR_11="#BB9FC2"           # Bright Green (Exec)
export COLOR_12="#EED8E5"           # Bright Yellow
export COLOR_13="#90758D"           # Bright Blue (Folder)
export COLOR_14="#C29EB6"           # Bright Magenta
export COLOR_15="#BB9FC2"           # Bright Cyan
export COLOR_16="#EED8E5"           # Bright White

export BACKGROUND_COLOR="#0C0611"   # Background
export FOREGROUND_COLOR="#EED8E5"   # Foreground (Text)

export CURSOR_COLOR="#EED8E5" # Cursor

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
