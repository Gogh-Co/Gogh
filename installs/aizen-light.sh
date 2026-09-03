#!/usr/bin/env bash

export PROFILE_NAME="Aizen Light"

export COLOR_01="#F0F2F6"           # Black (Host)
export COLOR_02="#D00C36"           # Red (Syntax string)
export COLOR_03="#3E9E28"           # Green (Command)
export COLOR_04="#DD8C1A"           # Yellow (Command second)
export COLOR_05="#1C64F2"           # Blue (Path)
export COLOR_06="#8636EC"           # Magenta (Syntax var)
export COLOR_07="#159096"           # Cyan (Prompt)
export COLOR_08="#4A4D66"           # White

export COLOR_09="#ADB2BC"           # Bright Black
export COLOR_10="#D00C36"           # Bright Red (Command error)
export COLOR_11="#3E9E28"           # Bright Green (Exec)
export COLOR_12="#DD8C1A"           # Bright Yellow
export COLOR_13="#1C64F2"           # Bright Blue (Folder)
export COLOR_14="#8636EC"           # Bright Magenta
export COLOR_15="#159096"           # Bright Cyan
export COLOR_16="#4A4D66"           # Bright White

export BACKGROUND_COLOR="#F0F2F6"   # Background
export FOREGROUND_COLOR="#4A4D66"   # Foreground (Text)

export CURSOR_COLOR="#FC6008" # Cursor

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
