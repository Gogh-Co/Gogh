#!/usr/bin/env bash

export PROFILE_NAME="Starlight"

export COLOR_01="#242424"           # Black (Host)
export COLOR_02="#E2425D"           # Red (Syntax string)
export COLOR_03="#66B238"           # Green (Command)
export COLOR_04="#DEC541"           # Yellow (Command second)
export COLOR_05="#54AAD0"           # Blue (Path)
export COLOR_06="#E8B2F8"           # Magenta (Syntax var)
export COLOR_07="#5ABF9B"           # Cyan (Prompt)
export COLOR_08="#E6E6E6"           # White

export COLOR_09="#616161"           # Bright Black
export COLOR_10="#EC5B58"           # Bright Red (Command error)
export COLOR_11="#6BD162"           # Bright Green (Exec)
export COLOR_12="#E9E85C"           # Bright Yellow
export COLOR_13="#78C3F3"           # Bright Blue (Folder)
export COLOR_14="#F2AFEE"           # Bright Magenta
export COLOR_15="#6ADCC5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#242424"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
