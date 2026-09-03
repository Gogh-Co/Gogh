#!/usr/bin/env bash

export PROFILE_NAME="Jubi"

export COLOR_01="#3B3750"           # Black (Host)
export COLOR_02="#CF7B98"           # Red (Syntax string)
export COLOR_03="#90A94B"           # Green (Command)
export COLOR_04="#6EBFC0"           # Yellow (Command second)
export COLOR_05="#576EA6"           # Blue (Path)
export COLOR_06="#BC4F68"           # Magenta (Syntax var)
export COLOR_07="#75A7D2"           # Cyan (Prompt)
export COLOR_08="#C3D3DE"           # White

export COLOR_09="#A874CE"           # Bright Black
export COLOR_10="#DE90AB"           # Bright Red (Command error)
export COLOR_11="#BCDD61"           # Bright Green (Exec)
export COLOR_12="#87E9EA"           # Bright Yellow
export COLOR_13="#8C9FCD"           # Bright Blue (Folder)
export COLOR_14="#E16C87"           # Bright Magenta
export COLOR_15="#B7C9EF"           # Bright Cyan
export COLOR_16="#D5E5F1"           # Bright White

export BACKGROUND_COLOR="#262B33"   # Background
export FOREGROUND_COLOR="#C3D3DE"   # Foreground (Text)

export CURSOR_COLOR="#C3D3DE" # Cursor

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
