#!/usr/bin/env bash

export PROFILE_NAME="London Columbia Road"

export COLOR_01="#2A2520"           # Black (Host)
export COLOR_02="#C14A4A"           # Red (Syntax string)
export COLOR_03="#5A8A3A"           # Green (Command)
export COLOR_04="#D4A82C"           # Yellow (Command second)
export COLOR_05="#3A7A8A"           # Blue (Path)
export COLOR_06="#C45F8A"           # Magenta (Syntax var)
export COLOR_07="#5FA89A"           # Cyan (Prompt)
export COLOR_08="#1F3A2F"           # White

export COLOR_09="#756A55"           # Bright Black
export COLOR_10="#D96A6A"           # Bright Red (Command error)
export COLOR_11="#6EA050"           # Bright Green (Exec)
export COLOR_12="#E5BC40"           # Bright Yellow
export COLOR_13="#5598AB"           # Bright Blue (Folder)
export COLOR_14="#D97AA3"           # Bright Magenta
export COLOR_15="#7AC0B0"           # Bright Cyan
export COLOR_16="#142217"           # Bright White

export BACKGROUND_COLOR="#F8F5EC"   # Background
export FOREGROUND_COLOR="#1F3A2F"   # Foreground (Text)

export CURSOR_COLOR="#D4708E" # Cursor

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
