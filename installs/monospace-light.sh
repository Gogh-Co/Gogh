#!/usr/bin/env bash

export PROFILE_NAME="Monospace Light"

export COLOR_01="#333E4F"           # Black (Host)
export COLOR_02="#D03941"           # Red (Syntax string)
export COLOR_03="#007B49"           # Green (Command)
export COLOR_04="#A65921"           # Yellow (Command second)
export COLOR_05="#3C60DD"           # Blue (Path)
export COLOR_06="#6F4CDE"           # Magenta (Syntax var)
export COLOR_07="#0075A2"           # Cyan (Prompt)
export COLOR_08="#5D6A7D"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#A52430"           # Bright Red (Command error)
export COLOR_11="#00522F"           # Bright Green (Exec)
export COLOR_12="#904B1A"           # Bright Yellow
export COLOR_13="#002487"           # Bright Blue (Folder)
export COLOR_14="#4D21BB"           # Bright Magenta
export COLOR_15="#00607E"           # Bright Cyan
export COLOR_16="#475365"           # Bright White

export BACKGROUND_COLOR="#F4F7FD"   # Background
export FOREGROUND_COLOR="#475365"   # Foreground (Text)

export CURSOR_COLOR="#6F4CDE" # Cursor

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
