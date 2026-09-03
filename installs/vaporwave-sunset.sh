#!/usr/bin/env bash

export PROFILE_NAME="Vaporwave Sunset"

export COLOR_01="#4B3D53"           # Black (Host)
export COLOR_02="#FB7185"           # Red (Syntax string)
export COLOR_03="#2DD4BF"           # Green (Command)
export COLOR_04="#FB923C"           # Yellow (Command second)
export COLOR_05="#A78BFA"           # Blue (Path)
export COLOR_06="#22D3EE"           # Magenta (Syntax var)
export COLOR_07="#FF4FD8"           # Cyan (Prompt)
export COLOR_08="#F0ABFC"           # White

export COLOR_09="#563F6E"           # Bright Black
export COLOR_10="#FC8D9D"           # Bright Red (Command error)
export COLOR_11="#57DDCC"           # Bright Green (Exec)
export COLOR_12="#FCA65F"           # Bright Yellow
export COLOR_13="#B9A2FB"           # Bright Blue (Folder)
export COLOR_14="#4EDCF1"           # Bright Magenta
export COLOR_15="#FF72E0"           # Bright Cyan
export COLOR_16="#FFF7ED"           # Bright White

export BACKGROUND_COLOR="#180827"   # Background
export FOREGROUND_COLOR="#FFF7ED"   # Foreground (Text)

export CURSOR_COLOR="#FFF7ED" # Cursor

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
