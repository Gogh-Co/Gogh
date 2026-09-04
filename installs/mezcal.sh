#!/usr/bin/env bash

export PROFILE_NAME="Mezcal"

export COLOR_01="#13110E"           # Black (Host)
export COLOR_02="#DA6E54"           # Red (Syntax string)
export COLOR_03="#A8B84A"           # Green (Command)
export COLOR_04="#D9A441"           # Yellow (Command second)
export COLOR_05="#8AA6C0"           # Blue (Path)
export COLOR_06="#C28AA8"           # Magenta (Syntax var)
export COLOR_07="#6FC8AE"           # Cyan (Prompt)
export COLOR_08="#E0D8C8"           # White

export COLOR_09="#6E6450"           # Bright Black
export COLOR_10="#DA6E54"           # Bright Red (Command error)
export COLOR_11="#A8B84A"           # Bright Green (Exec)
export COLOR_12="#D9A441"           # Bright Yellow
export COLOR_13="#8AA6C0"           # Bright Blue (Folder)
export COLOR_14="#C28AA8"           # Bright Magenta
export COLOR_15="#6FC8AE"           # Bright Cyan
export COLOR_16="#F2EAD6"           # Bright White

export BACKGROUND_COLOR="#13110E"   # Background
export FOREGROUND_COLOR="#E0D8C8"   # Foreground (Text)

export CURSOR_COLOR="#E0D8C8" # Cursor

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
