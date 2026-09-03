#!/usr/bin/env bash

export PROFILE_NAME="Light Owl"

export COLOR_01="#403F53"           # Black (Host)
export COLOR_02="#DE3D3B"           # Red (Syntax string)
export COLOR_03="#08916A"           # Green (Command)
export COLOR_04="#E0AF02"           # Yellow (Command second)
export COLOR_05="#288ED7"           # Blue (Path)
export COLOR_06="#D6438A"           # Magenta (Syntax var)
export COLOR_07="#2AA298"           # Cyan (Prompt)
export COLOR_08="#F0F0F0"           # White

export COLOR_09="#989FB1"           # Bright Black
export COLOR_10="#DE3D3B"           # Bright Red (Command error)
export COLOR_11="#08916A"           # Bright Green (Exec)
export COLOR_12="#DAAA01"           # Bright Yellow
export COLOR_13="#288ED7"           # Bright Blue (Folder)
export COLOR_14="#D6438A"           # Bright Magenta
export COLOR_15="#2AA298"           # Bright Cyan
export COLOR_16="#F0F0F0"           # Bright White

export BACKGROUND_COLOR="#FBFBFB"   # Background
export FOREGROUND_COLOR="#403F53"   # Foreground (Text)

export CURSOR_COLOR="#403F53" # Cursor

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
