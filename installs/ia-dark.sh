#!/usr/bin/env bash

export PROFILE_NAME="Ia Dark"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#D88568"           # Red (Syntax string)
export COLOR_03="#83A471"           # Green (Command)
export COLOR_04="#B99353"           # Yellow (Command second)
export COLOR_05="#8ECCDD"           # Blue (Path)
export COLOR_06="#B98EB2"           # Magenta (Syntax var)
export COLOR_07="#7C9CAE"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#767676"           # Bright Black
export COLOR_10="#D88568"           # Bright Red (Command error)
export COLOR_11="#83A471"           # Bright Green (Exec)
export COLOR_12="#B99353"           # Bright Yellow
export COLOR_13="#8ECCDD"           # Bright Blue (Folder)
export COLOR_14="#B98EB2"           # Bright Magenta
export COLOR_15="#7C9CAE"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
