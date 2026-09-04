#!/usr/bin/env bash

export PROFILE_NAME="bl1nk"

export COLOR_01="#1A1C1D"           # Black (Host)
export COLOR_02="#FF5894"           # Red (Syntax string)
export COLOR_03="#B5E354"           # Green (Command)
export COLOR_04="#F5921D"           # Yellow (Command second)
export COLOR_05="#4E81AA"           # Blue (Path)
export COLOR_06="#8B54FE"           # Magenta (Syntax var)
export COLOR_07="#465456"           # Cyan (Prompt)
export COLOR_08="#CBCBC5"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#F92571"           # Bright Red (Command error)
export COLOR_11="#81B313"           # Bright Green (Exec)
export COLOR_12="#FEED6B"           # Bright Yellow
export COLOR_13="#0B72C1"           # Bright Blue (Folder)
export COLOR_14="#9D6EFE"           # Bright Magenta
export COLOR_15="#889BA1"           # Bright Cyan
export COLOR_16="#F8F8F2"           # Bright White

export BACKGROUND_COLOR="#111111"   # Background
export FOREGROUND_COLOR="#A0A0A0"   # Foreground (Text)

export CURSOR_COLOR="#A0A0A0" # Cursor

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
