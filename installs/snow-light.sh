#!/usr/bin/env bash

export PROFILE_NAME="Snow Light"

export COLOR_01="#FBFFFF"           # Black (Host)
export COLOR_02="#AE5865"           # Red (Syntax string)
export COLOR_03="#4D7F43"           # Green (Command)
export COLOR_04="#906C33"           # Yellow (Command second)
export COLOR_05="#2B7AB2"           # Blue (Path)
export COLOR_06="#8F63A2"           # Magenta (Syntax var)
export COLOR_07="#008483"           # Cyan (Prompt)
export COLOR_08="#535C65"           # White

export COLOR_09="#6D7782"           # Bright Black
export COLOR_10="#AE5865"           # Bright Red (Command error)
export COLOR_11="#4D7F43"           # Bright Green (Exec)
export COLOR_12="#906C33"           # Bright Yellow
export COLOR_13="#2B7AB2"           # Bright Blue (Folder)
export COLOR_14="#8F63A2"           # Bright Magenta
export COLOR_15="#008483"           # Bright Cyan
export COLOR_16="#434951"           # Bright White

export BACKGROUND_COLOR="#FBFFFF"   # Background
export FOREGROUND_COLOR="#535C65"   # Foreground (Text)

export CURSOR_COLOR="#535C65" # Cursor

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
