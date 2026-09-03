#!/usr/bin/env bash

export PROFILE_NAME="Fahrenheit"

export COLOR_01="#1D1D1D"           # Black (Host)
export COLOR_02="#CDA074"           # Red (Syntax string)
export COLOR_03="#9E744D"           # Green (Command)
export COLOR_04="#FECF75"           # Yellow (Command second)
export COLOR_05="#720102"           # Blue (Path)
export COLOR_06="#734C4D"           # Magenta (Syntax var)
export COLOR_07="#979797"           # Cyan (Prompt)
export COLOR_08="#FFFFCE"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FECEA0"           # Bright Red (Command error)
export COLOR_11="#CC734D"           # Bright Green (Exec)
export COLOR_12="#FD9F4D"           # Bright Yellow
export COLOR_13="#CB4A05"           # Bright Blue (Folder)
export COLOR_14="#4E739F"           # Bright Magenta
export COLOR_15="#FED04D"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFCE"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
