#!/usr/bin/env bash

export PROFILE_NAME="Flatland"

export COLOR_01="#1D1D19"           # Black (Host)
export COLOR_02="#F18339"           # Red (Syntax string)
export COLOR_03="#9FD364"           # Green (Command)
export COLOR_04="#F4EF6D"           # Yellow (Command second)
export COLOR_05="#5096BE"           # Blue (Path)
export COLOR_06="#695ABC"           # Magenta (Syntax var)
export COLOR_07="#D63865"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#1D1D19"           # Bright Black
export COLOR_10="#D22A24"           # Bright Red (Command error)
export COLOR_11="#A7D42C"           # Bright Green (Exec)
export COLOR_12="#FF8949"           # Bright Yellow
export COLOR_13="#61B9D0"           # Bright Blue (Folder)
export COLOR_14="#695ABC"           # Bright Magenta
export COLOR_15="#D63865"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D1F21"   # Background
export FOREGROUND_COLOR="#B8DBEF"   # Foreground (Text)

export CURSOR_COLOR="#B8DBEF" # Cursor

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
