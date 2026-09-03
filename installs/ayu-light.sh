#!/usr/bin/env bash

export PROFILE_NAME="Ayu Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EA6C6D"           # Red (Syntax string)
export COLOR_03="#6CBF43"           # Green (Command)
export COLOR_04="#ECA944"           # Yellow (Command second)
export COLOR_05="#3199E1"           # Blue (Path)
export COLOR_06="#9E75C7"           # Magenta (Syntax var)
export COLOR_07="#46BA94"           # Cyan (Prompt)
export COLOR_08="#BABABA"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#F07171"           # Bright Red (Command error)
export COLOR_11="#86B300"           # Bright Green (Exec)
export COLOR_12="#F2AE49"           # Bright Yellow
export COLOR_13="#399EE6"           # Bright Blue (Folder)
export COLOR_14="#A37ACC"           # Bright Magenta
export COLOR_15="#4CBF99"           # Bright Cyan
export COLOR_16="#D1D1D1"           # Bright White

export BACKGROUND_COLOR="#F8F9FA"   # Background
export FOREGROUND_COLOR="#5C6166"   # Foreground (Text)

export CURSOR_COLOR="#FFAA33" # Cursor

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
