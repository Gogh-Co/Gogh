#!/usr/bin/env bash

export PROFILE_NAME="Atelier Plateau Light"

export COLOR_01="#F4ECEC"           # Black (Host)
export COLOR_02="#CA4949"           # Red (Syntax string)
export COLOR_03="#4B8B8B"           # Green (Command)
export COLOR_04="#A06E3B"           # Yellow (Command second)
export COLOR_05="#7272CA"           # Blue (Path)
export COLOR_06="#8464C4"           # Magenta (Syntax var)
export COLOR_07="#5485B6"           # Cyan (Prompt)
export COLOR_08="#585050"           # White

export COLOR_09="#7E7777"           # Bright Black
export COLOR_10="#CA4949"           # Bright Red (Command error)
export COLOR_11="#4B8B8B"           # Bright Green (Exec)
export COLOR_12="#A06E3B"           # Bright Yellow
export COLOR_13="#7272CA"           # Bright Blue (Folder)
export COLOR_14="#8464C4"           # Bright Magenta
export COLOR_15="#5485B6"           # Bright Cyan
export COLOR_16="#1B1818"           # Bright White

export BACKGROUND_COLOR="#F4ECEC"   # Background
export FOREGROUND_COLOR="#585050"   # Foreground (Text)

export CURSOR_COLOR="#585050" # Cursor

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
