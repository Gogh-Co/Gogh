#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Latte"

export COLOR_01="#5C5F77"           # Black (Host)
export COLOR_02="#D20F39"           # Red (Syntax string)
export COLOR_03="#40A02B"           # Green (Command)
export COLOR_04="#DF8E1D"           # Yellow (Command second)
export COLOR_05="#1E66F5"           # Blue (Path)
export COLOR_06="#EA76CB"           # Magenta (Syntax var)
export COLOR_07="#179299"           # Cyan (Prompt)
export COLOR_08="#ACB0BE"           # White

export COLOR_09="#6C6F85"           # Bright Black
export COLOR_10="#D20F39"           # Bright Red (Command error)
export COLOR_11="#40A02B"           # Bright Green (Exec)
export COLOR_12="#DF8E1D"           # Bright Yellow
export COLOR_13="#1E66F5"           # Bright Blue (Folder)
export COLOR_14="#EA76CB"           # Bright Magenta
export COLOR_15="#179299"           # Bright Cyan
export COLOR_16="#BCC0CC"           # Bright White

export BACKGROUND_COLOR="#EFF1F5"   # Background
export FOREGROUND_COLOR="#4C4F69"   # Foreground (Text)

export CURSOR_COLOR="#4C4F69" # Cursor

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
