#!/usr/bin/env bash

export PROFILE_NAME="Pastel Cyberpunk"

export COLOR_01="#38404F"           # Black (Host)
export COLOR_02="#FF3838"           # Red (Syntax string)
export COLOR_03="#DC38D0"           # Green (Command)
export COLOR_04="#F79538"           # Yellow (Command second)
export COLOR_05="#4B6C9B"           # Blue (Path)
export COLOR_06="#904DA9"           # Magenta (Syntax var)
export COLOR_07="#3FCBD2"           # Cyan (Prompt)
export COLOR_08="#3FCBD2"           # White

export COLOR_09="#4D83CF"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#DB33CF"           # Bright Green (Exec)
export COLOR_12="#FF7899"           # Bright Yellow
export COLOR_13="#38FF38"           # Bright Blue (Folder)
export COLOR_14="#8D49A7"           # Bright Magenta
export COLOR_15="#3BCAD1"           # Bright Cyan
export COLOR_16="#3BCAD1"           # Bright White

export BACKGROUND_COLOR="#333B4B"   # Background
export FOREGROUND_COLOR="#3FCBD2"   # Foreground (Text)

export CURSOR_COLOR="#3FCBD2" # Cursor

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
