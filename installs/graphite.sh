#!/usr/bin/env bash

export PROFILE_NAME="Graphite"

export COLOR_01="#15171A"           # Black (Host)
export COLOR_02="#E58888"           # Red (Syntax string)
export COLOR_03="#A7C59F"           # Green (Command)
export COLOR_04="#CEC59D"           # Yellow (Command second)
export COLOR_05="#8DB4D0"           # Blue (Path)
export COLOR_06="#BAABCB"           # Magenta (Syntax var)
export COLOR_07="#A8C6D4"           # Cyan (Prompt)
export COLOR_08="#B4B9C0"           # White

export COLOR_09="#7E8590"           # Bright Black
export COLOR_10="#F19F9F"           # Bright Red (Command error)
export COLOR_11="#B9D5B1"           # Bright Green (Exec)
export COLOR_12="#CFBA97"           # Bright Yellow
export COLOR_13="#A5C6DE"           # Bright Blue (Folder)
export COLOR_14="#CCBEDD"           # Bright Magenta
export COLOR_15="#BCD6E2"           # Bright Cyan
export COLOR_16="#ECEFF3"           # Bright White

export BACKGROUND_COLOR="#1C1E22"   # Background
export FOREGROUND_COLOR="#D2D6DC"   # Foreground (Text)

export CURSOR_COLOR="#C4CEDB" # Cursor

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
