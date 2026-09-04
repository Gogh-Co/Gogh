#!/usr/bin/env bash

export PROFILE_NAME="Nordic"

export COLOR_01="#191C1D"           # Black (Host)
export COLOR_02="#BD6062"           # Red (Syntax string)
export COLOR_03="#A3D6A9"           # Green (Command)
export COLOR_04="#F0DFAF"           # Yellow (Command second)
export COLOR_05="#8FB4D8"           # Blue (Path)
export COLOR_06="#C7A9D9"           # Magenta (Syntax var)
export COLOR_07="#B6D7A8"           # Cyan (Prompt)
export COLOR_08="#BDC5BD"           # White

export COLOR_09="#727C7C"           # Bright Black
export COLOR_10="#D18FAF"           # Bright Red (Command error)
export COLOR_11="#B7CEB0"           # Bright Green (Exec)
export COLOR_12="#BCBCBC"           # Bright Yellow
export COLOR_13="#E0CF9F"           # Bright Blue (Folder)
export COLOR_14="#C7A9D9"           # Bright Magenta
export COLOR_15="#BBDA97"           # Bright Cyan
export COLOR_16="#BDC5BD"           # Bright White

export BACKGROUND_COLOR="#242933"   # Background
export FOREGROUND_COLOR="#BBBDAF"   # Foreground (Text)

export CURSOR_COLOR="#BBBDAF" # Cursor

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
