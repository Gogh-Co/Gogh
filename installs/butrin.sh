#!/usr/bin/env bash

export PROFILE_NAME="Butrin"

export COLOR_01="#8C7E78"           # Black (Host)
export COLOR_02="#E68A8A"           # Red (Syntax string)
export COLOR_03="#99CC99"           # Green (Command)
export COLOR_04="#FAD7A0"           # Yellow (Command second)
export COLOR_05="#6699CC"           # Blue (Path)
export COLOR_06="#C8A2C8"           # Magenta (Syntax var)
export COLOR_07="#6FC3B2"           # Cyan (Prompt)
export COLOR_08="#E2CEBE"           # White

export COLOR_09="#BFACA4"           # Bright Black
export COLOR_10="#F2B1B1"           # Bright Red (Command error)
export COLOR_11="#B2D8B2"           # Bright Green (Exec)
export COLOR_12="#F7DCB4"           # Bright Yellow
export COLOR_13="#87CEFA"           # Bright Blue (Folder)
export COLOR_14="#D8BFD8"           # Bright Magenta
export COLOR_15="#64DBDB"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#4B3B3C"   # Background
export FOREGROUND_COLOR="#F2F2F2"   # Foreground (Text)

export CURSOR_COLOR="#E39D93" # Cursor

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
