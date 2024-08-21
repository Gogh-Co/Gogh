#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Lake"

export COLOR_01="#192d34"           # Black (Host)
export COLOR_02="#3e91ac"           # Red (Syntax string)
export COLOR_03="#cbbb4d"           # Green (Command)
export COLOR_04="#ffeb66"           # Yellow (Command second)
export COLOR_05="#499fbc"           # Blue (Path)
export COLOR_06="#cbbb4d"           # Magenta (Syntax var)
export COLOR_07="#62b1cb"           # Cyan (Prompt)
export COLOR_08="#7ba8b7"           # White

export COLOR_09="#3d6876"           # Bright Black
export COLOR_10="#d6c65c"           # Bright Red (Command error)
export COLOR_11="#223c44"           # Bright Green (Exec)
export COLOR_12="#335966"           # Bright Yellow
export COLOR_13="#467686"           # Bright Blue (Folder)
export COLOR_14="#a5d8e9"           # Bright Magenta
export COLOR_15="#c4b031"           # Bright Cyan
export COLOR_16="#e1f7ff"           # Bright White

export BACKGROUND_COLOR="#192d34"   # Background
export FOREGROUND_COLOR="#7ba8b7"   # Foreground (Text)

export CURSOR_COLOR="#84740b" # Cursor

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
