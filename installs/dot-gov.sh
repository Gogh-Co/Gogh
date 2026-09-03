#!/usr/bin/env bash

export PROFILE_NAME="Dot Gov"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#BF091D"           # Red (Syntax string)
export COLOR_03="#3D9751"           # Green (Command)
export COLOR_04="#F6BB34"           # Yellow (Command second)
export COLOR_05="#17B2E0"           # Blue (Path)
export COLOR_06="#7830B0"           # Magenta (Syntax var)
export COLOR_07="#8BD2ED"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#191919"           # Bright Black
export COLOR_10="#BF091D"           # Bright Red (Command error)
export COLOR_11="#3D9751"           # Bright Green (Exec)
export COLOR_12="#F6BB34"           # Bright Yellow
export COLOR_13="#17B2E0"           # Bright Blue (Folder)
export COLOR_14="#7830B0"           # Bright Magenta
export COLOR_15="#8BD2ED"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#262C35"   # Background
export FOREGROUND_COLOR="#EBEBEB"   # Foreground (Text)

export CURSOR_COLOR="#D9002F" # Cursor

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
