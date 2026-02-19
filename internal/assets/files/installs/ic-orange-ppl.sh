#!/usr/bin/env bash

export PROFILE_NAME="Ic Orange Ppl"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C13900"           # Red (Syntax string)
export COLOR_03="#A4A900"           # Green (Command)
export COLOR_04="#CAAF00"           # Yellow (Command second)
export COLOR_05="#BD6D00"           # Blue (Path)
export COLOR_06="#FC5E00"           # Magenta (Syntax var)
export COLOR_07="#F79500"           # Cyan (Prompt)
export COLOR_08="#FFC88A"           # White

export COLOR_09="#6A4F2A"           # Bright Black
export COLOR_10="#FF8C68"           # Bright Red (Command error)
export COLOR_11="#F6FF40"           # Bright Green (Exec)
export COLOR_12="#FFE36E"           # Bright Yellow
export COLOR_13="#FFBE55"           # Bright Blue (Folder)
export COLOR_14="#FC874F"           # Bright Magenta
export COLOR_15="#C69752"           # Bright Cyan
export COLOR_16="#FAFAFF"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#FFCB83"   # Foreground (Text)

export CURSOR_COLOR="#FFCB83" # Cursor

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
