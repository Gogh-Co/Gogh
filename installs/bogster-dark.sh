#!/usr/bin/env bash

export PROFILE_NAME="Bogster Dark"

export COLOR_01="#161C23"           # Black (Host)
export COLOR_02="#BD2853"           # Red (Syntax string)
export COLOR_03="#549D2F"           # Green (Command)
export COLOR_04="#CCA734"           # Yellow (Command second)
export COLOR_05="#248BAA"           # Blue (Path)
export COLOR_06="#B759DC"           # Magenta (Syntax var)
export COLOR_07="#23A580"           # Cyan (Prompt)
export COLOR_08="#C6BFBA"           # White

export COLOR_09="#45576D"           # Bright Black
export COLOR_10="#DB567C"           # Bright Red (Command error)
export COLOR_11="#6FCC4C"           # Bright Green (Exec)
export COLOR_12="#DFC26B"           # Bright Yellow
export COLOR_13="#4FBADB"           # Bright Blue (Folder)
export COLOR_14="#DC59C0"           # Bright Magenta
export COLOR_15="#59DCB7"           # Bright Cyan
export COLOR_16="#DFD7D0"           # Bright White

export BACKGROUND_COLOR="#161C23"   # Background
export FOREGROUND_COLOR="#C6BFBA"   # Foreground (Text)

export CURSOR_COLOR="#C6BFBA" # Cursor

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
