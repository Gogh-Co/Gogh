#!/usr/bin/env bash

export PROFILE_NAME="Retrowave Dark"

export COLOR_01="#7C676F"           # Black (Host)
export COLOR_02="#F06060"           # Red (Syntax string)
export COLOR_03="#A5D164"           # Green (Command)
export COLOR_04="#F3B562"           # Yellow (Command second)
export COLOR_05="#6A9FD8"           # Blue (Path)
export COLOR_06="#ED80B1"           # Magenta (Syntax var)
export COLOR_07="#8CBEB2"           # Cyan (Prompt)
export COLOR_08="#F2EBBF"           # White

export COLOR_09="#967E86"           # Bright Black
export COLOR_10="#FC8F8F"           # Bright Red (Command error)
export COLOR_11="#C1EF7C"           # Bright Green (Exec)
export COLOR_12="#FCD29C"           # Bright Yellow
export COLOR_13="#89BDF4"           # Bright Blue (Folder)
export COLOR_14="#FCABD0"           # Bright Magenta
export COLOR_15="#AEE2D6"           # Bright Cyan
export COLOR_16="#FCF8DE"           # Bright White

export BACKGROUND_COLOR="#5C4B51"   # Background
export FOREGROUND_COLOR="#F3B562"   # Foreground (Text)

export CURSOR_COLOR="#F3B562" # Cursor

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
