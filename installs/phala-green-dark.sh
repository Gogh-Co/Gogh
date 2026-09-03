#!/usr/bin/env bash

export PROFILE_NAME="Phala Green Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#9D2814"           # Red (Syntax string)
export COLOR_03="#4AAE31"           # Green (Command)
export COLOR_04="#A9A733"           # Yellow (Command second)
export COLOR_05="#0C23B8"           # Blue (Path)
export COLOR_06="#B23BBA"           # Magenta (Syntax var)
export COLOR_07="#4BB1BD"           # Cyan (Prompt)
export COLOR_08="#CBCBCB"           # White

export COLOR_09="#797979"           # Bright Black
export COLOR_10="#DA3B20"           # Bright Red (Command error)
export COLOR_11="#5DD83F"           # Bright Green (Exec)
export COLOR_12="#E9E74A"           # Bright Yellow
export COLOR_13="#1432F5"           # Bright Blue (Folder)
export COLOR_14="#DA4BE3"           # Bright Magenta
export COLOR_15="#64E5E8"           # Bright Cyan
export COLOR_16="#EAEAEA"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#CDFA50"   # Foreground (Text)

export CURSOR_COLOR="#CDFA50" # Cursor

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
