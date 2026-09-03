#!/usr/bin/env bash

export PROFILE_NAME="Arcoiris"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#DA2700"           # Red (Syntax string)
export COLOR_03="#12C258"           # Green (Command)
export COLOR_04="#FFC656"           # Yellow (Command second)
export COLOR_05="#518BFC"           # Blue (Path)
export COLOR_06="#E37BD9"           # Magenta (Syntax var)
export COLOR_07="#63FAD5"           # Cyan (Prompt)
export COLOR_08="#BAB2B2"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#FFB9B9"           # Bright Red (Command error)
export COLOR_11="#E3F6AA"           # Bright Green (Exec)
export COLOR_12="#FFDDAA"           # Bright Yellow
export COLOR_13="#B3E8F3"           # Bright Blue (Folder)
export COLOR_14="#CBBAF9"           # Bright Magenta
export COLOR_15="#BCFFC7"           # Bright Cyan
export COLOR_16="#EFEFEF"           # Bright White

export BACKGROUND_COLOR="#201F1E"   # Background
export FOREGROUND_COLOR="#EEE4D9"   # Foreground (Text)

export CURSOR_COLOR="#7A1C1C" # Cursor

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
