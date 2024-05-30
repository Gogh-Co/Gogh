#!/usr/bin/env bash

export PROFILE_NAME="Symphonic"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DC322F"           # Red (Syntax string)
export COLOR_03="#56DB3A"           # Green (Command)
export COLOR_04="#FF8400"           # Yellow (Command second)
export COLOR_05="#0084D4"           # Blue (Path)
export COLOR_06="#B729D9"           # Magenta (Syntax var)
export COLOR_07="#CCCCFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#1B1D21"           # Bright Black
export COLOR_10="#DC322F"           # Bright Red (Command error)
export COLOR_11="#56DB3A"           # Bright Green (Exec)
export COLOR_12="#FF8400"           # Bright Yellow
export COLOR_13="#0084D4"           # Bright Blue (Folder)
export COLOR_14="#B729D9"           # Bright Magenta
export COLOR_15="#CCCCFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
