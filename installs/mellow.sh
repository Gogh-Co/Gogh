#!/usr/bin/env bash

export PROFILE_NAME="Mellow"

export COLOR_01="#27272A"           # Black (Host)
export COLOR_02="#F5A191"           # Red (Syntax string)
export COLOR_03="#90B99F"           # Green (Command)
export COLOR_04="#E6B99D"           # Yellow (Command second)
export COLOR_05="#ACA1CF"           # Blue (Path)
export COLOR_06="#E29ECA"           # Magenta (Syntax var)
export COLOR_07="#EA83A5"           # Cyan (Prompt)
export COLOR_08="#C1C0D4"           # White

export COLOR_09="#353539"           # Bright Black
export COLOR_10="#FFAE9F"           # Bright Red (Command error)
export COLOR_11="#9DC6AC"           # Bright Green (Exec)
export COLOR_12="#F0C5A9"           # Bright Yellow
export COLOR_13="#B9AEDA"           # Bright Blue (Folder)
export COLOR_14="#ECAAD6"           # Bright Magenta
export COLOR_15="#F591B2"           # Bright Cyan
export COLOR_16="#CAC9DD"           # Bright White

export BACKGROUND_COLOR="#161617"   # Background
export FOREGROUND_COLOR="#C9C7CD"   # Foreground (Text)

export CURSOR_COLOR="#CAC9DD" # Cursor

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
