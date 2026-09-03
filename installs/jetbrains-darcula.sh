#!/usr/bin/env bash

export PROFILE_NAME="JetBrains Darcula"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FA5355"           # Red (Syntax string)
export COLOR_03="#126E00"           # Green (Command)
export COLOR_04="#C2C300"           # Yellow (Command second)
export COLOR_05="#4581EB"           # Blue (Path)
export COLOR_06="#FA54FF"           # Magenta (Syntax var)
export COLOR_07="#33C2C1"           # Cyan (Prompt)
export COLOR_08="#ADADAD"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FB7172"           # Bright Red (Command error)
export COLOR_11="#67FF4F"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#6D9DF1"           # Bright Blue (Folder)
export COLOR_14="#FB82FF"           # Bright Magenta
export COLOR_15="#60D3D1"           # Bright Cyan
export COLOR_16="#EEEEEE"           # Bright White

export BACKGROUND_COLOR="#202020"   # Background
export FOREGROUND_COLOR="#ADADAD"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
