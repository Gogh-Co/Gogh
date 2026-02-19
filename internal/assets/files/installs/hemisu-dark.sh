#!/usr/bin/env bash

export PROFILE_NAME="Hemisu Dark"

export COLOR_01="#444444"           # Black (Host)
export COLOR_02="#FF0054"           # Red (Syntax string)
export COLOR_03="#B1D630"           # Green (Command)
export COLOR_04="#9D895E"           # Yellow (Command second)
export COLOR_05="#67BEE3"           # Blue (Path)
export COLOR_06="#B576BC"           # Magenta (Syntax var)
export COLOR_07="#569A9F"           # Cyan (Prompt)
export COLOR_08="#EDEDED"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#D65E75"           # Bright Red (Command error)
export COLOR_11="#BAFFAA"           # Bright Green (Exec)
export COLOR_12="#ECE1C8"           # Bright Yellow
export COLOR_13="#9FD3E5"           # Bright Blue (Folder)
export COLOR_14="#DEB3DF"           # Bright Magenta
export COLOR_15="#B6E0E5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#BAFFAA" # Cursor

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
