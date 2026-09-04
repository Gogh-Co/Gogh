#!/usr/bin/env bash

export PROFILE_NAME="Porple"

export COLOR_01="#292C36"           # Black (Host)
export COLOR_02="#F84547"           # Red (Syntax string)
export COLOR_03="#95C76F"           # Green (Command)
export COLOR_04="#EFA16B"           # Yellow (Command second)
export COLOR_05="#8485CE"           # Blue (Path)
export COLOR_06="#B74989"           # Magenta (Syntax var)
export COLOR_07="#64878F"           # Cyan (Prompt)
export COLOR_08="#D8D8D8"           # White

export COLOR_09="#65568A"           # Bright Black
export COLOR_10="#F84547"           # Bright Red (Command error)
export COLOR_11="#95C76F"           # Bright Green (Exec)
export COLOR_12="#EFA16B"           # Bright Yellow
export COLOR_13="#8485CE"           # Bright Blue (Folder)
export COLOR_14="#B74989"           # Bright Magenta
export COLOR_15="#64878F"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#292C36"   # Background
export FOREGROUND_COLOR="#D8D8D8"   # Foreground (Text)

export CURSOR_COLOR="#D8D8D8" # Cursor

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
