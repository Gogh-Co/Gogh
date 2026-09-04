#!/usr/bin/env bash

export PROFILE_NAME="Ganbaru Matcha"

export COLOR_01="#17181D"           # Black (Host)
export COLOR_02="#E86081"           # Red (Syntax string)
export COLOR_03="#75C186"           # Green (Command)
export COLOR_04="#FFAF5D"           # Yellow (Command second)
export COLOR_05="#95BFF0"           # Blue (Path)
export COLOR_06="#B5A7EF"           # Magenta (Syntax var)
export COLOR_07="#54CEC4"           # Cyan (Prompt)
export COLOR_08="#7B8E95"           # White

export COLOR_09="#475254"           # Bright Black
export COLOR_10="#FF6D7E"           # Bright Red (Command error)
export COLOR_11="#B1C771"           # Bright Green (Exec)
export COLOR_12="#E5DE8C"           # Bright Yellow
export COLOR_13="#A7D9F1"           # Bright Blue (Folder)
export COLOR_14="#F3ACE2"           # Bright Magenta
export COLOR_15="#A9D9BD"           # Bright Cyan
export COLOR_16="#859298"           # Bright White

export BACKGROUND_COLOR="#17181D"   # Background
export FOREGROUND_COLOR="#E1E5EC"   # Foreground (Text)

export CURSOR_COLOR="#E1E5EC" # Cursor

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
