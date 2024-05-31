#!/usr/bin/env bash

export PROFILE_NAME="Oxocarbon Dark"

export COLOR_01="#262626"           # Black (Host)
export COLOR_02="#EE5396"           # Red (Syntax string)
export COLOR_03="#42BE65"           # Green (Command)
export COLOR_04="#FFE97B"           # Yellow (Command second)
export COLOR_05="#33B1FF"           # Blue (Path)
export COLOR_06="#FF7EB6"           # Magenta (Syntax var)
export COLOR_07="#3DDBD9"           # Cyan (Prompt)
export COLOR_08="#DDE1E6"           # White

export COLOR_09="#393939"           # Bright Black
export COLOR_10="#EE5396"           # Bright Red (Command error)
export COLOR_11="#42BE65"           # Bright Green (Exec)
export COLOR_12="#FFE97B"           # Bright Yellow
export COLOR_13="#33B1FF"           # Bright Blue (Folder)
export COLOR_14="#FF7EB6"           # Bright Magenta
export COLOR_15="#3DDBD9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#161616"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#6F6F6F" # Cursor

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
