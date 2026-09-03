#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Lake"

export COLOR_01="#192D34"           # Black (Host)
export COLOR_02="#3E91AC"           # Red (Syntax string)
export COLOR_03="#CBBB4D"           # Green (Command)
export COLOR_04="#FFEB66"           # Yellow (Command second)
export COLOR_05="#499FBC"           # Blue (Path)
export COLOR_06="#CBBB4D"           # Magenta (Syntax var)
export COLOR_07="#62B1CB"           # Cyan (Prompt)
export COLOR_08="#7BA8B7"           # White

export COLOR_09="#3D6876"           # Bright Black
export COLOR_10="#D6C65C"           # Bright Red (Command error)
export COLOR_11="#223C44"           # Bright Green (Exec)
export COLOR_12="#335966"           # Bright Yellow
export COLOR_13="#467686"           # Bright Blue (Folder)
export COLOR_14="#A5D8E9"           # Bright Magenta
export COLOR_15="#C4B031"           # Bright Cyan
export COLOR_16="#E1F7FF"           # Bright White

export BACKGROUND_COLOR="#192D34"   # Background
export FOREGROUND_COLOR="#7BA8B7"   # Foreground (Text)

export CURSOR_COLOR="#84740B" # Cursor

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
