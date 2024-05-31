#!/usr/bin/env bash

export PROFILE_NAME="Cai"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CA274D"           # Red (Syntax string)
export COLOR_03="#4DCA27"           # Green (Command)
export COLOR_04="#CAA427"           # Yellow (Command second)
export COLOR_05="#274DCA"           # Blue (Path)
export COLOR_06="#A427CA"           # Magenta (Syntax var)
export COLOR_07="#27CAA4"           # Cyan (Prompt)
export COLOR_08="#808080"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#E98DA3"           # Bright Red (Command error)
export COLOR_11="#A3E98D"           # Bright Green (Exec)
export COLOR_12="#E9D48D"           # Bright Yellow
export COLOR_13="#8DA3E9"           # Bright Blue (Folder)
export COLOR_14="#D48DE9"           # Bright Magenta
export COLOR_15="#8DE9D4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#09111A"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
