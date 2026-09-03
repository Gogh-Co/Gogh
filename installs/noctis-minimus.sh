#!/usr/bin/env bash

export PROFILE_NAME="Noctis Minimus"

export COLOR_01="#182A35"           # Black (Host)
export COLOR_02="#C08872"           # Red (Syntax string)
export COLOR_03="#72C09F"           # Green (Command)
export COLOR_04="#C8A984"           # Yellow (Command second)
export COLOR_05="#6196B8"           # Blue (Path)
export COLOR_06="#C28097"           # Magenta (Syntax var)
export COLOR_07="#72B7C0"           # Cyan (Prompt)
export COLOR_08="#C5CDD3"           # White

export COLOR_09="#425866"           # Bright Black
export COLOR_10="#CA8468"           # Bright Red (Command error)
export COLOR_11="#84C8AB"           # Bright Green (Exec)
export COLOR_12="#D1AA7B"           # Bright Yellow
export COLOR_13="#68A4CA"           # Bright Blue (Folder)
export COLOR_14="#C88DA2"           # Bright Magenta
export COLOR_15="#84C0C8"           # Bright Cyan
export COLOR_16="#C5D1D3"           # Bright White

export BACKGROUND_COLOR="#1B2932"   # Background
export FOREGROUND_COLOR="#C5CDD3"   # Foreground (Text)

export CURSOR_COLOR="#C5CDD3" # Cursor

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
