#!/usr/bin/env bash

export PROFILE_NAME="Raycast Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B12424"           # Red (Syntax string)
export COLOR_03="#006B4F"           # Green (Command)
export COLOR_04="#F8A300"           # Yellow (Command second)
export COLOR_05="#138AF2"           # Blue (Path)
export COLOR_06="#9A1B6E"           # Magenta (Syntax var)
export COLOR_07="#3EB8BF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#B12424"           # Bright Red (Command error)
export COLOR_11="#006B4F"           # Bright Green (Exec)
export COLOR_12="#F8A300"           # Bright Yellow
export COLOR_13="#138AF2"           # Bright Blue (Folder)
export COLOR_14="#9A1B6E"           # Bright Magenta
export COLOR_15="#3EB8BF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
