#!/usr/bin/env bash

export PROFILE_NAME="Bosque"

export COLOR_01="#0E1410"           # Black (Host)
export COLOR_02="#E2706A"           # Red (Syntax string)
export COLOR_03="#6FC56E"           # Green (Command)
export COLOR_04="#C8B84A"           # Yellow (Command second)
export COLOR_05="#6DAE9E"           # Blue (Path)
export COLOR_06="#B894D0"           # Magenta (Syntax var)
export COLOR_07="#5FD0B8"           # Cyan (Prompt)
export COLOR_08="#CFE5D2"           # White

export COLOR_09="#5C6E5E"           # Bright Black
export COLOR_10="#E2706A"           # Bright Red (Command error)
export COLOR_11="#6FC56E"           # Bright Green (Exec)
export COLOR_12="#C8B84A"           # Bright Yellow
export COLOR_13="#6DAE9E"           # Bright Blue (Folder)
export COLOR_14="#B894D0"           # Bright Magenta
export COLOR_15="#5FD0B8"           # Bright Cyan
export COLOR_16="#E4F0E2"           # Bright White

export BACKGROUND_COLOR="#0E1410"   # Background
export FOREGROUND_COLOR="#CFE5D2"   # Foreground (Text)

export CURSOR_COLOR="#CFE5D2" # Cursor

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
