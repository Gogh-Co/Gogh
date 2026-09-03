#!/usr/bin/env bash

export PROFILE_NAME="Farmhouse Light"

export COLOR_01="#1D2027"           # Black (Host)
export COLOR_02="#8D0003"           # Red (Syntax string)
export COLOR_03="#3A7D00"           # Green (Command)
export COLOR_04="#A95600"           # Yellow (Command second)
export COLOR_05="#092CCD"           # Blue (Path)
export COLOR_06="#820046"           # Magenta (Syntax var)
export COLOR_07="#229256"           # Cyan (Prompt)
export COLOR_08="#E8E4E1"           # White

export COLOR_09="#394047"           # Bright Black
export COLOR_10="#EB0009"           # Bright Red (Command error)
export COLOR_11="#7AC100"           # Bright Green (Exec)
export COLOR_12="#EA9A00"           # Bright Yellow
export COLOR_13="#006EFE"           # Bright Blue (Folder)
export COLOR_14="#BF3B7F"           # Bright Magenta
export COLOR_15="#19E062"           # Bright Cyan
export COLOR_16="#F4EEF0"           # Bright White

export BACKGROUND_COLOR="#E8E4E1"   # Background
export FOREGROUND_COLOR="#1D2027"   # Foreground (Text)

export CURSOR_COLOR="#006EFE" # Cursor

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
