#!/usr/bin/env bash

export PROFILE_NAME="tinted8 Catppuccin Mocha"

export COLOR_01="#1E1E2E"           # Black (Host)
export COLOR_02="#F38BA8"           # Red (Syntax string)
export COLOR_03="#A6E3A1"           # Green (Command)
export COLOR_04="#F9E2AF"           # Yellow (Command second)
export COLOR_05="#89B4FA"           # Blue (Path)
export COLOR_06="#CBA6F7"           # Magenta (Syntax var)
export COLOR_07="#94E2D5"           # Cyan (Prompt)
export COLOR_08="#CDD6F4"           # White

export COLOR_09="#353554"           # Bright Black
export COLOR_10="#F9C2D2"           # Bright Red (Command error)
export COLOR_11="#D3F1D0"           # Bright Green (Exec)
export COLOR_12="#FCF6E9"           # Bright Yellow
export COLOR_13="#C4D9FC"           # Bright Blue (Folder)
export COLOR_14="#ECE0FB"           # Bright Magenta
export COLOR_15="#C4EFE8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

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
