#!/usr/bin/env bash

export PROFILE_NAME="Catppuccin Mocha"

export COLOR_01="#45475A"           # Black (Host)
export COLOR_02="#F38BA8"           # Red (Syntax string)
export COLOR_03="#A6E3A1"           # Green (Command)
export COLOR_04="#F9E2AF"           # Yellow (Command second)
export COLOR_05="#89B4FA"           # Blue (Path)
export COLOR_06="#F5C2E7"           # Magenta (Syntax var)
export COLOR_07="#94E2D5"           # Cyan (Prompt)
export COLOR_08="#BAC2DE"           # White

export COLOR_09="#585B70"           # Bright Black
export COLOR_10="#F38BA8"           # Bright Red (Command error)
export COLOR_11="#A6E3A1"           # Bright Green (Exec)
export COLOR_12="#F9E2AF"           # Bright Yellow
export COLOR_13="#89B4FA"           # Bright Blue (Folder)
export COLOR_14="#F5C2E7"           # Bright Magenta
export COLOR_15="#94E2D5"           # Bright Cyan
export COLOR_16="#A6ADC8"           # Bright White

export BACKGROUND_COLOR="#1E1E2E"   # Background
export FOREGROUND_COLOR="#CDD6F4"   # Foreground (Text)

export CURSOR_COLOR="#CDD6F4" # Cursor

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
