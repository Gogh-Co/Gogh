#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Light"

export COLOR_01="#353B3C"           # Black (Host)
export COLOR_02="#E84C58"           # Red (Syntax string)
export COLOR_03="#13665F"           # Green (Command)
export COLOR_04="#E36B3F"           # Yellow (Command second)
export COLOR_05="#3B84CC"           # Blue (Path)
export COLOR_06="#A9779C"           # Magenta (Syntax var)
export COLOR_07="#6FACB3"           # Cyan (Prompt)
export COLOR_08="#C8CCC3"           # White

export COLOR_09="#4B5254"           # Bright Black
export COLOR_10="#E84C58"           # Bright Red (Command error)
export COLOR_11="#317A56"           # Bright Green (Exec)
export COLOR_12="#C5882C"           # Bright Yellow
export COLOR_13="#4C7A90"           # Bright Blue (Folder)
export COLOR_14="#6D46E3"           # Bright Magenta
export COLOR_15="#008B8B"           # Bright Cyan
export COLOR_16="#4B5254"           # Bright White

export BACKGROUND_COLOR="#EDEEEB"   # Background
export FOREGROUND_COLOR="#353B3C"   # Foreground (Text)

export CURSOR_COLOR="#353B3C" # Cursor

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
