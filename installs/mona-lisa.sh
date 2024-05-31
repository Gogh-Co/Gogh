#!/usr/bin/env bash

export PROFILE_NAME="Mona Lisa"

export COLOR_01="#351B0E"           # Black (Host)
export COLOR_02="#9B291C"           # Red (Syntax string)
export COLOR_03="#636232"           # Green (Command)
export COLOR_04="#C36E28"           # Yellow (Command second)
export COLOR_05="#515C5D"           # Blue (Path)
export COLOR_06="#9B1D29"           # Magenta (Syntax var)
export COLOR_07="#588056"           # Cyan (Prompt)
export COLOR_08="#F7D75C"           # White

export COLOR_09="#874228"           # Bright Black
export COLOR_10="#FF4331"           # Bright Red (Command error)
export COLOR_11="#B4B264"           # Bright Green (Exec)
export COLOR_12="#FF9566"           # Bright Yellow
export COLOR_13="#9EB2B4"           # Bright Blue (Folder)
export COLOR_14="#FF5B6A"           # Bright Magenta
export COLOR_15="#8ACD8F"           # Bright Cyan
export COLOR_16="#FFE598"           # Bright White

export BACKGROUND_COLOR="#120B0D"   # Background
export FOREGROUND_COLOR="#F7D66A"   # Foreground (Text)

export CURSOR_COLOR="#F7D66A" # Cursor

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
