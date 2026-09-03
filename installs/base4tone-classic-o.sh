#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic O"

export COLOR_01="#1A1D23"           # Black (Host)
export COLOR_02="#A24AD9"           # Red (Syntax string)
export COLOR_03="#0D9C89"           # Green (Command)
export COLOR_04="#1ED2BA"           # Yellow (Command second)
export COLOR_05="#74A8FB"           # Blue (Path)
export COLOR_06="#9488F2"           # Magenta (Syntax var)
export COLOR_07="#1BBBA6"           # Cyan (Prompt)
export COLOR_08="#E7EAEE"           # White

export COLOR_09="#07090D"           # Bright Black
export COLOR_10="#C27EED"           # Bright Red (Command error)
export COLOR_11="#2FDAC3"           # Bright Green (Exec)
export COLOR_12="#93ECE0"           # Bright Yellow
export COLOR_13="#C7DCFF"           # Bright Blue (Folder)
export COLOR_14="#ABA1F7"           # Bright Magenta
export COLOR_15="#C2D9FF"           # Bright Cyan
export COLOR_16="#F6F7F9"           # Bright White

export BACKGROUND_COLOR="#1A1D23"   # Background
export FOREGROUND_COLOR="#8995A9"   # Foreground (Text)

export CURSOR_COLOR="#6D8884" # Cursor

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
