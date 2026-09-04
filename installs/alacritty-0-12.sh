#!/usr/bin/env bash

export PROFILE_NAME="Alacritty 0 12"

export COLOR_01="#1D1F21"           # Black (Host)
export COLOR_02="#CC6666"           # Red (Syntax string)
export COLOR_03="#B5BD68"           # Green (Command)
export COLOR_04="#F0C674"           # Yellow (Command second)
export COLOR_05="#81A2BE"           # Blue (Path)
export COLOR_06="#B294BB"           # Magenta (Syntax var)
export COLOR_07="#8ABEB7"           # Cyan (Prompt)
export COLOR_08="#C5C8C6"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#D54E53"           # Bright Red (Command error)
export COLOR_11="#B9CA4A"           # Bright Green (Exec)
export COLOR_12="#E7C547"           # Bright Yellow
export COLOR_13="#7AA6DA"           # Bright Blue (Folder)
export COLOR_14="#C397D8"           # Bright Magenta
export COLOR_15="#70C0B1"           # Bright Cyan
export COLOR_16="#EAEAEA"           # Bright White

export BACKGROUND_COLOR="#1D1F21"   # Background
export FOREGROUND_COLOR="#C5C8C6"   # Foreground (Text)

export CURSOR_COLOR="#C5C8C6" # Cursor

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
