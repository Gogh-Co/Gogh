#!/usr/bin/env bash

export PROFILE_NAME="Wilmersdorf"

export COLOR_01="#34373E"           # Black (Host)
export COLOR_02="#E06383"           # Red (Syntax string)
export COLOR_03="#7EBEBD"           # Green (Command)
export COLOR_04="#CCCCCC"           # Yellow (Command second)
export COLOR_05="#A6C1E0"           # Blue (Path)
export COLOR_06="#E1C1EE"           # Magenta (Syntax var)
export COLOR_07="#5B94AB"           # Cyan (Prompt)
export COLOR_08="#ABABAB"           # White

export COLOR_09="#434750"           # Bright Black
export COLOR_10="#FA7193"           # Bright Red (Command error)
export COLOR_11="#8FD7D6"           # Bright Green (Exec)
export COLOR_12="#D1DFFF"           # Bright Yellow
export COLOR_13="#B2CFF0"           # Bright Blue (Folder)
export COLOR_14="#EFCCFD"           # Bright Magenta
export COLOR_15="#69ABC5"           # Bright Cyan
export COLOR_16="#D3D3D3"           # Bright White

export BACKGROUND_COLOR="#282B33"   # Background
export FOREGROUND_COLOR="#C6C6C6"   # Foreground (Text)

export CURSOR_COLOR="#7EBEBD" # Cursor

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
