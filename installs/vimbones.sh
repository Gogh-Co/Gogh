#!/usr/bin/env bash

export PROFILE_NAME="Vimbones"

export COLOR_01="#F0F0CA"           # Black (Host)
export COLOR_02="#A8334C"           # Red (Syntax string)
export COLOR_03="#4F6C31"           # Green (Command)
export COLOR_04="#944927"           # Yellow (Command second)
export COLOR_05="#286486"           # Blue (Path)
export COLOR_06="#88507D"           # Magenta (Syntax var)
export COLOR_07="#3B8992"           # Cyan (Prompt)
export COLOR_08="#353535"           # White

export COLOR_09="#C6C6A3"           # Bright Black
export COLOR_10="#94253E"           # Bright Red (Command error)
export COLOR_11="#3F5A22"           # Bright Green (Exec)
export COLOR_12="#803D1C"           # Bright Yellow
export COLOR_13="#1D5573"           # Bright Blue (Folder)
export COLOR_14="#7B3B70"           # Bright Magenta
export COLOR_15="#2B747C"           # Bright Cyan
export COLOR_16="#5C5C5C"           # Bright White

export BACKGROUND_COLOR="#F0F0CA"   # Background
export FOREGROUND_COLOR="#353535"   # Foreground (Text)

export CURSOR_COLOR="#353535" # Cursor

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
