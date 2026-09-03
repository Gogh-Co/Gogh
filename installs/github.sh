#!/usr/bin/env bash

export PROFILE_NAME="GitHub"

export COLOR_01="#3E3E3E"           # Black (Host)
export COLOR_02="#970B16"           # Red (Syntax string)
export COLOR_03="#07962A"           # Green (Command)
export COLOR_04="#F8EEC7"           # Yellow (Command second)
export COLOR_05="#003E8A"           # Blue (Path)
export COLOR_06="#E94691"           # Magenta (Syntax var)
export COLOR_07="#89D1EC"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#DE0000"           # Bright Red (Command error)
export COLOR_11="#87D5A2"           # Bright Green (Exec)
export COLOR_12="#F1D007"           # Bright Yellow
export COLOR_13="#2E6CBA"           # Bright Blue (Folder)
export COLOR_14="#FFA29F"           # Bright Magenta
export COLOR_15="#1CFAFE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#F4F4F4"   # Background
export FOREGROUND_COLOR="#3E3E3E"   # Foreground (Text)

export CURSOR_COLOR="#3F3F3F" # Cursor

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
