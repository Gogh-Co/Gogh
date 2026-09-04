#!/usr/bin/env bash

export PROFILE_NAME="Primer Dark"

export COLOR_01="#010409"           # Black (Host)
export COLOR_02="#FF7B72"           # Red (Syntax string)
export COLOR_03="#3FB950"           # Green (Command)
export COLOR_04="#D29922"           # Yellow (Command second)
export COLOR_05="#58A6FF"           # Blue (Path)
export COLOR_06="#F778BA"           # Magenta (Syntax var)
export COLOR_07="#A5D6FF"           # Cyan (Prompt)
export COLOR_08="#B1BAC4"           # White

export COLOR_09="#484F58"           # Bright Black
export COLOR_10="#FF7B72"           # Bright Red (Command error)
export COLOR_11="#3FB950"           # Bright Green (Exec)
export COLOR_12="#D29922"           # Bright Yellow
export COLOR_13="#58A6FF"           # Bright Blue (Folder)
export COLOR_14="#F778BA"           # Bright Magenta
export COLOR_15="#A5D6FF"           # Bright Cyan
export COLOR_16="#F0F6FC"           # Bright White

export BACKGROUND_COLOR="#010409"   # Background
export FOREGROUND_COLOR="#B1BAC4"   # Foreground (Text)

export CURSOR_COLOR="#B1BAC4" # Cursor

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
