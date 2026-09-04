#!/usr/bin/env bash

export PROFILE_NAME="Goa Base"

export COLOR_01="#880041"           # Black (Host)
export COLOR_02="#F78000"           # Red (Syntax string)
export COLOR_03="#249000"           # Green (Command)
export COLOR_04="#F40000"           # Yellow (Command second)
export COLOR_05="#000482"           # Blue (Path)
export COLOR_06="#F43BFF"           # Magenta (Syntax var)
export COLOR_07="#3AFFFF"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#411A6D"           # Bright Black
export COLOR_10="#F800E1"           # Bright Red (Command error)
export COLOR_11="#5743FF"           # Bright Green (Exec)
export COLOR_12="#EA00D7"           # Bright Yellow
export COLOR_13="#B90003"           # Bright Blue (Folder)
export COLOR_14="#9A5952"           # Bright Magenta
export COLOR_15="#C8F9F3"           # Bright Cyan
export COLOR_16="#F5F4FB"           # Bright White

export BACKGROUND_COLOR="#2F0033"   # Background
export FOREGROUND_COLOR="#F6ED00"   # Foreground (Text)

export CURSOR_COLOR="#F6ED00" # Cursor

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
