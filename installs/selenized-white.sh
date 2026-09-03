#!/usr/bin/env bash

export PROFILE_NAME="Selenized White"

export COLOR_01="#EBEBEB"           # Black (Host)
export COLOR_02="#D6000C"           # Red (Syntax string)
export COLOR_03="#1D9700"           # Green (Command)
export COLOR_04="#C49700"           # Yellow (Command second)
export COLOR_05="#0064E4"           # Blue (Path)
export COLOR_06="#DD0F9D"           # Magenta (Syntax var)
export COLOR_07="#00AD9C"           # Cyan (Prompt)
export COLOR_08="#878787"           # White

export COLOR_09="#CDCDCD"           # Bright Black
export COLOR_10="#BF0000"           # Bright Red (Command error)
export COLOR_11="#008400"           # Bright Green (Exec)
export COLOR_12="#AF8500"           # Bright Yellow
export COLOR_13="#0054CF"           # Bright Blue (Folder)
export COLOR_14="#C7008B"           # Bright Magenta
export COLOR_15="#009A8A"           # Bright Cyan
export COLOR_16="#282828"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#474747"   # Foreground (Text)

export CURSOR_COLOR="#282828" # Cursor

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
