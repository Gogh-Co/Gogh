#!/usr/bin/env bash

export PROFILE_NAME="Night Owl"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#EF5350"           # Red (Syntax string)
export COLOR_03="#22DA6E"           # Green (Command)
export COLOR_04="#ADDB67"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#21C7A8"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#EF5350"           # Bright Red (Command error)
export COLOR_11="#22DA6E"           # Bright Green (Exec)
export COLOR_12="#FFEB95"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#C792EA"           # Bright Magenta
export COLOR_15="#7FDBCA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#011627"   # Background
export FOREGROUND_COLOR="#D6DEEB"   # Foreground (Text)

export CURSOR_COLOR="#D6DEEB" # Cursor

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
