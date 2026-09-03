#!/usr/bin/env bash

export PROFILE_NAME="JetBrains Islands Dark"

export COLOR_01="#191A1C"           # Black (Host)
export COLOR_02="#F75464"           # Red (Syntax string)
export COLOR_03="#6AAB73"           # Green (Command)
export COLOR_04="#CF8E6D"           # Yellow (Command second)
export COLOR_05="#56A8F5"           # Blue (Path)
export COLOR_06="#C77DBB"           # Magenta (Syntax var)
export COLOR_07="#2AACB8"           # Cyan (Prompt)
export COLOR_08="#BCBEC4"           # White

export COLOR_09="#7A7E85"           # Bright Black
export COLOR_10="#F57E84"           # Bright Red (Command error)
export COLOR_11="#6DB083"           # Bright Green (Exec)
export COLOR_12="#F0AC81"           # Bright Yellow
export COLOR_13="#548AF7"           # Bright Blue (Folder)
export COLOR_14="#B189F5"           # Bright Magenta
export COLOR_15="#16BAAC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#191A1C"   # Background
export FOREGROUND_COLOR="#BCBEC4"   # Foreground (Text)

export CURSOR_COLOR="#CED0D6" # Cursor

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
