#!/usr/bin/env bash

export PROFILE_NAME="Windows 10 Light"

export COLOR_01="#F2F2F2"           # Black (Host)
export COLOR_02="#C50F1F"           # Red (Syntax string)
export COLOR_03="#13A10E"           # Green (Command)
export COLOR_04="#C19C00"           # Yellow (Command second)
export COLOR_05="#0037DA"           # Blue (Path)
export COLOR_06="#881798"           # Magenta (Syntax var)
export COLOR_07="#3A96DD"           # Cyan (Prompt)
export COLOR_08="#767676"           # White

export COLOR_09="#CCCCCC"           # Bright Black
export COLOR_10="#C50F1F"           # Bright Red (Command error)
export COLOR_11="#13A10E"           # Bright Green (Exec)
export COLOR_12="#C19C00"           # Bright Yellow
export COLOR_13="#0037DA"           # Bright Blue (Folder)
export COLOR_14="#881798"           # Bright Magenta
export COLOR_15="#3A96DD"           # Bright Cyan
export COLOR_16="#0C0C0C"           # Bright White

export BACKGROUND_COLOR="#F2F2F2"   # Background
export FOREGROUND_COLOR="#767676"   # Foreground (Text)

export CURSOR_COLOR="#767676" # Cursor

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
