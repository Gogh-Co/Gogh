#!/usr/bin/env bash

export PROFILE_NAME="Lovelace"

export COLOR_01="#282A36"           # Black (Host)
export COLOR_02="#F37F97"           # Red (Syntax string)
export COLOR_03="#5ADECD"           # Green (Command)
export COLOR_04="#F2A272"           # Yellow (Command second)
export COLOR_05="#8897F4"           # Blue (Path)
export COLOR_06="#C574DD"           # Magenta (Syntax var)
export COLOR_07="#79E6F3"           # Cyan (Prompt)
export COLOR_08="#FDFDFD"           # White

export COLOR_09="#414458"           # Bright Black
export COLOR_10="#FF4971"           # Bright Red (Command error)
export COLOR_11="#18E3C8"           # Bright Green (Exec)
export COLOR_12="#FF8037"           # Bright Yellow
export COLOR_13="#556FFF"           # Bright Blue (Folder)
export COLOR_14="#B043D1"           # Bright Magenta
export COLOR_15="#3FDCEE"           # Bright Cyan
export COLOR_16="#BEBEC1"           # Bright White

export BACKGROUND_COLOR="#1D1F28"   # Background
export FOREGROUND_COLOR="#FDFDFD"   # Foreground (Text)

export CURSOR_COLOR="#C574DD" # Cursor

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
