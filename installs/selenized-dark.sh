#!/usr/bin/env bash

export PROFILE_NAME="Selenized Dark"

export COLOR_01="#184956"           # Black (Host)
export COLOR_02="#FA5750"           # Red (Syntax string)
export COLOR_03="#75B938"           # Green (Command)
export COLOR_04="#DBB32D"           # Yellow (Command second)
export COLOR_05="#4695F7"           # Blue (Path)
export COLOR_06="#F275BE"           # Magenta (Syntax var)
export COLOR_07="#41C7B9"           # Cyan (Prompt)
export COLOR_08="#ADBCBC"           # White

export COLOR_09="#72898F"           # Bright Black
export COLOR_10="#FF665C"           # Bright Red (Command error)
export COLOR_11="#84C747"           # Bright Green (Exec)
export COLOR_12="#EBC13D"           # Bright Yellow
export COLOR_13="#58A3FF"           # Bright Blue (Folder)
export COLOR_14="#FF84CD"           # Bright Magenta
export COLOR_15="#53D6C7"           # Bright Cyan
export COLOR_16="#CAD8D9"           # Bright White

export BACKGROUND_COLOR="#103C48"   # Background
export FOREGROUND_COLOR="#ADBCBC"   # Foreground (Text)

export CURSOR_COLOR="#ADBCBC" # Cursor

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
