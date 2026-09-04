#!/usr/bin/env bash

export PROFILE_NAME="Lucy"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FB7DA7"           # Red (Syntax string)
export COLOR_03="#76C5A4"           # Green (Command)
export COLOR_04="#E8D56D"           # Yellow (Command second)
export COLOR_05="#3465A4"           # Blue (Path)
export COLOR_06="#AF98E6"           # Magenta (Syntax var)
export COLOR_07="#56C9DB"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FB7DA7"           # Bright Red (Command error)
export COLOR_11="#76C5A4"           # Bright Green (Exec)
export COLOR_12="#E8D56D"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#AF98E6"           # Bright Magenta
export COLOR_15="#56C9DB"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#1A1B23"   # Background
export FOREGROUND_COLOR="#96979B"   # Foreground (Text)

export CURSOR_COLOR="#96979B" # Cursor

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
