#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Light"

export COLOR_01="#FEFAF9"           # Black (Host)
export COLOR_02="#E14775"           # Red (Syntax string)
export COLOR_03="#269D69"           # Green (Command)
export COLOR_04="#CC7A0A"           # Yellow (Command second)
export COLOR_05="#E16032"           # Blue (Path)
export COLOR_06="#7058BE"           # Magenta (Syntax var)
export COLOR_07="#1C8CA8"           # Cyan (Prompt)
export COLOR_08="#29242A"           # White

export COLOR_09="#6E6B6A"           # Bright Black
export COLOR_10="#E14775"           # Bright Red (Command error)
export COLOR_11="#269D69"           # Bright Green (Exec)
export COLOR_12="#CC7A0A"           # Bright Yellow
export COLOR_13="#E16032"           # Bright Blue (Folder)
export COLOR_14="#7058BE"           # Bright Magenta
export COLOR_15="#1C8CA8"           # Bright Cyan
export COLOR_16="#29242A"           # Bright White

export BACKGROUND_COLOR="#FEFAF9"   # Background
export FOREGROUND_COLOR="#29242A"   # Foreground (Text)

export CURSOR_COLOR="#29242A" # Cursor

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
