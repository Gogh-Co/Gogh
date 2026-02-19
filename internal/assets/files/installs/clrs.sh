#!/usr/bin/env bash

export PROFILE_NAME="Clrs"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F8282A"           # Red (Syntax string)
export COLOR_03="#328A5D"           # Green (Command)
export COLOR_04="#FA701D"           # Yellow (Command second)
export COLOR_05="#135CD0"           # Blue (Path)
export COLOR_06="#9F00BD"           # Magenta (Syntax var)
export COLOR_07="#33C3C1"           # Cyan (Prompt)
export COLOR_08="#B3B3B3"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FB0416"           # Bright Red (Command error)
export COLOR_11="#2CC631"           # Bright Green (Exec)
export COLOR_12="#FDD727"           # Bright Yellow
export COLOR_13="#1670FF"           # Bright Blue (Folder)
export COLOR_14="#E900B0"           # Bright Magenta
export COLOR_15="#3AD5CE"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#262626"   # Foreground (Text)

export CURSOR_COLOR="#262626" # Cursor

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
