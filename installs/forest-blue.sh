#!/usr/bin/env bash

export PROFILE_NAME="Forest Blue"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#F8818E"           # Red (Syntax string)
export COLOR_03="#92D3A2"           # Green (Command)
export COLOR_04="#1A8E63"           # Yellow (Command second)
export COLOR_05="#8ED0CE"           # Blue (Path)
export COLOR_06="#5E468C"           # Magenta (Syntax var)
export COLOR_07="#31658C"           # Cyan (Prompt)
export COLOR_08="#E2D8CD"           # White

export COLOR_09="#3D3D3D"           # Bright Black
export COLOR_10="#FB3D66"           # Bright Red (Command error)
export COLOR_11="#6BB48D"           # Bright Green (Exec)
export COLOR_12="#30C85A"           # Bright Yellow
export COLOR_13="#39A7A2"           # Bright Blue (Folder)
export COLOR_14="#7E62B3"           # Bright Magenta
export COLOR_15="#6096BF"           # Bright Cyan
export COLOR_16="#E2D8CD"           # Bright White

export BACKGROUND_COLOR="#051519"   # Background
export FOREGROUND_COLOR="#E2D8CD"   # Foreground (Text)

export CURSOR_COLOR="#9E9ECB" # Cursor

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
