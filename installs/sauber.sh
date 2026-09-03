#!/usr/bin/env bash

export PROFILE_NAME="Sauber"

export COLOR_01="#15191E"           # Black (Host)
export COLOR_02="#A74532"           # Red (Syntax string)
export COLOR_03="#57BF38"           # Green (Command)
export COLOR_04="#C7C43F"           # Yellow (Command second)
export COLOR_05="#2E43C0"           # Blue (Path)
export COLOR_06="#B149B8"           # Magenta (Syntax var)
export COLOR_07="#59C2C6"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#D07E78"           # Bright Red (Command error)
export COLOR_11="#82E498"           # Bright Green (Exec)
export COLOR_12="#EAE24A"           # Bright Yellow
export COLOR_13="#A7ABED"           # Bright Blue (Folder)
export COLOR_14="#D483DC"           # Bright Magenta
export COLOR_15="#3D898E"           # Bright Cyan
export COLOR_16="#9F8133"           # Bright White

export BACKGROUND_COLOR="#F0FEE8"   # Background
export FOREGROUND_COLOR="#2244ED"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
