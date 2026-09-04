#!/usr/bin/env bash

export PROFILE_NAME="Aquarium Light"

export COLOR_01="#D5D4E0"           # Black (Host)
export COLOR_02="#C34864"           # Red (Syntax string)
export COLOR_03="#7D9685"           # Green (Command)
export COLOR_04="#DE956F"           # Yellow (Command second)
export COLOR_05="#6A8CBC"           # Blue (Path)
export COLOR_06="#8787BF"           # Magenta (Syntax var)
export COLOR_07="#829FB0"           # Cyan (Prompt)
export COLOR_08="#313449"           # White

export COLOR_09="#CCCBD9"           # Bright Black
export COLOR_10="#B7435E"           # Bright Red (Command error)
export COLOR_11="#7E8F80"           # Bright Green (Exec)
export COLOR_12="#D88B72"           # Bright Yellow
export COLOR_13="#6E7EBF"           # Bright Blue (Folder)
export COLOR_14="#7170C2"           # Bright Magenta
export COLOR_15="#728A9A"           # Bright Cyan
export COLOR_16="#414560"           # Bright White

export BACKGROUND_COLOR="#E6E6F1"   # Background
export FOREGROUND_COLOR="#708190"   # Foreground (Text)

export CURSOR_COLOR="#708190" # Cursor

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
