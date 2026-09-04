#!/usr/bin/env bash

export PROFILE_NAME="Sweet Mars"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#F67E7D"           # Red (Syntax string)
export COLOR_03="#CAE7B9"           # Green (Command)
export COLOR_04="#E1DD8F"           # Yellow (Command second)
export COLOR_05="#729FCF"           # Blue (Path)
export COLOR_06="#D7BCC8"           # Magenta (Syntax var)
export COLOR_07="#A0C1B9"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#F67E7D"           # Bright Red (Command error)
export COLOR_11="#CAE7B9"           # Bright Green (Exec)
export COLOR_12="#E1DD8F"           # Bright Yellow
export COLOR_13="#729FCF"           # Bright Blue (Folder)
export COLOR_14="#D7BCC8"           # Bright Magenta
export COLOR_15="#A0C1B9"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#1A1E21"   # Background
export FOREGROUND_COLOR="#B6B7B9"   # Foreground (Text)

export CURSOR_COLOR="#B6B7B9" # Cursor

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
