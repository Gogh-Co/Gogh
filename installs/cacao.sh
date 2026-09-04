#!/usr/bin/env bash

export PROFILE_NAME="Cacao"

export COLOR_01="#160F0C"           # Black (Host)
export COLOR_02="#E0705C"           # Red (Syntax string)
export COLOR_03="#9AC97A"           # Green (Command)
export COLOR_04="#E8A84A"           # Yellow (Command second)
export COLOR_05="#A89AD0"           # Blue (Path)
export COLOR_06="#CE8AB0"           # Magenta (Syntax var)
export COLOR_07="#74C8B0"           # Cyan (Prompt)
export COLOR_08="#E8D6C4"           # White

export COLOR_09="#766052"           # Bright Black
export COLOR_10="#E0705C"           # Bright Red (Command error)
export COLOR_11="#9AC97A"           # Bright Green (Exec)
export COLOR_12="#E8A84A"           # Bright Yellow
export COLOR_13="#A89AD0"           # Bright Blue (Folder)
export COLOR_14="#CE8AB0"           # Bright Magenta
export COLOR_15="#74C8B0"           # Bright Cyan
export COLOR_16="#F4E6D6"           # Bright White

export BACKGROUND_COLOR="#160F0C"   # Background
export FOREGROUND_COLOR="#E8D6C4"   # Foreground (Text)

export CURSOR_COLOR="#E8D6C4" # Cursor

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
