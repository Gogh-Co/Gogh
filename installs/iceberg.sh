#!/usr/bin/env bash

export PROFILE_NAME="Iceberg"

export COLOR_01="#161821"           # Black (Host)
export COLOR_02="#E27878"           # Red (Syntax string)
export COLOR_03="#B4BE82"           # Green (Command)
export COLOR_04="#E2A478"           # Yellow (Command second)
export COLOR_05="#84A0C6"           # Blue (Path)
export COLOR_06="#A093C7"           # Magenta (Syntax var)
export COLOR_07="#89B8C2"           # Cyan (Prompt)
export COLOR_08="#C6C8D1"           # White

export COLOR_09="#6B7089"           # Bright Black
export COLOR_10="#E98989"           # Bright Red (Command error)
export COLOR_11="#C0CA8E"           # Bright Green (Exec)
export COLOR_12="#E9B189"           # Bright Yellow
export COLOR_13="#91ACD1"           # Bright Blue (Folder)
export COLOR_14="#ADA0D3"           # Bright Magenta
export COLOR_15="#95C4CE"           # Bright Cyan
export COLOR_16="#D2D4DE"           # Bright White

export BACKGROUND_COLOR="#161821"   # Background
export FOREGROUND_COLOR="#C6C8D1"   # Foreground (Text)

export CURSOR_COLOR="#D2D4DE" # Cursor

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
