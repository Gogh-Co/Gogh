#!/usr/bin/env bash

export PROFILE_NAME="Wryan"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#8C4665"           # Red (Syntax string)
export COLOR_03="#287373"           # Green (Command)
export COLOR_04="#7C7C99"           # Yellow (Command second)
export COLOR_05="#395573"           # Blue (Path)
export COLOR_06="#5E468C"           # Magenta (Syntax var)
export COLOR_07="#31658C"           # Cyan (Prompt)
export COLOR_08="#899CA1"           # White

export COLOR_09="#3D3D3D"           # Bright Black
export COLOR_10="#BF4D80"           # Bright Red (Command error)
export COLOR_11="#53A6A6"           # Bright Green (Exec)
export COLOR_12="#9E9ECB"           # Bright Yellow
export COLOR_13="#477AB3"           # Bright Blue (Folder)
export COLOR_14="#7E62B3"           # Bright Magenta
export COLOR_15="#6096BF"           # Bright Cyan
export COLOR_16="#C0C0C0"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#999993"   # Foreground (Text)

export CURSOR_COLOR="#999993" # Cursor

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
