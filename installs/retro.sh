#!/usr/bin/env bash

export PROFILE_NAME="Retro"

export COLOR_01="#13A10E"           # Black (Host)
export COLOR_02="#13A10E"           # Red (Syntax string)
export COLOR_03="#13A10E"           # Green (Command)
export COLOR_04="#13A10E"           # Yellow (Command second)
export COLOR_05="#13A10E"           # Blue (Path)
export COLOR_06="#13A10E"           # Magenta (Syntax var)
export COLOR_07="#13A10E"           # Cyan (Prompt)
export COLOR_08="#13A10E"           # White

export COLOR_09="#16BA10"           # Bright Black
export COLOR_10="#16BA10"           # Bright Red (Command error)
export COLOR_11="#16BA10"           # Bright Green (Exec)
export COLOR_12="#16BA10"           # Bright Yellow
export COLOR_13="#16BA10"           # Bright Blue (Folder)
export COLOR_14="#16BA10"           # Bright Magenta
export COLOR_15="#16BA10"           # Bright Cyan
export COLOR_16="#16BA10"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#13A10E"   # Foreground (Text)

export CURSOR_COLOR="#13A10E" # Cursor

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
