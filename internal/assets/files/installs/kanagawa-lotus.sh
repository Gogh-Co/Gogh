#!/usr/bin/env bash

export PROFILE_NAME="Kanagawa Lotus"

export COLOR_01="#1f1f28"           # Black (Host)
export COLOR_02="#c84053"           # Red (Syntax string)
export COLOR_03="#6f894e"           # Green (Command)
export COLOR_04="#77713f"           # Yellow (Command second)
export COLOR_05="#4d699b"           # Blue (Path)
export COLOR_06="#b35b79"           # Magenta (Syntax var)
export COLOR_07="#597b75"           # Cyan (Prompt)
export COLOR_08="#545464"           # White

export COLOR_09="#8a8980"           # Bright Black
export COLOR_10="#d7474b"           # Bright Red (Command error)
export COLOR_11="#6e915f"           # Bright Green (Exec)
export COLOR_12="#836f4a"           # Bright Yellow
export COLOR_13="#6693bf"           # Bright Blue (Folder)
export COLOR_14="#624c83"           # Bright Magenta
export COLOR_15="#5e857a"           # Bright Cyan
export COLOR_16="#43436c"           # Bright White

export BACKGROUND_COLOR="#f2ecbc"   # Background
export FOREGROUND_COLOR="#545464"   # Foreground (Text)

export CURSOR_COLOR="#43436c" # Cursor

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
