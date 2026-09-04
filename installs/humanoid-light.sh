#!/usr/bin/env bash

export PROFILE_NAME="Humanoid Light"

export COLOR_01="#F8F8F2"           # Black (Host)
export COLOR_02="#B0151A"           # Red (Syntax string)
export COLOR_03="#388E3C"           # Green (Command)
export COLOR_04="#FFB627"           # Yellow (Command second)
export COLOR_05="#0082C9"           # Blue (Path)
export COLOR_06="#700F98"           # Magenta (Syntax var)
export COLOR_07="#008E8E"           # Cyan (Prompt)
export COLOR_08="#232629"           # White

export COLOR_09="#C0C0BD"           # Bright Black
export COLOR_10="#B0151A"           # Bright Red (Command error)
export COLOR_11="#388E3C"           # Bright Green (Exec)
export COLOR_12="#FFB627"           # Bright Yellow
export COLOR_13="#0082C9"           # Bright Blue (Folder)
export COLOR_14="#700F98"           # Bright Magenta
export COLOR_15="#008E8E"           # Bright Cyan
export COLOR_16="#070708"           # Bright White

export BACKGROUND_COLOR="#F8F8F2"   # Background
export FOREGROUND_COLOR="#232629"   # Foreground (Text)

export CURSOR_COLOR="#232629" # Cursor

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
