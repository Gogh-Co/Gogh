#!/usr/bin/env bash

export PROFILE_NAME="Tempus Classic"

export COLOR_01="#232323"           # Black (Host)
export COLOR_02="#d4823d"           # Red (Syntax string)
export COLOR_03="#8c9e3d"           # Green (Command)
export COLOR_04="#b1942b"           # Yellow (Command second)
export COLOR_05="#6e9cb0"           # Blue (Path)
export COLOR_06="#b58d88"           # Magenta (Syntax var)
export COLOR_07="#6da280"           # Cyan (Prompt)
export COLOR_08="#949d9f"           # White

export COLOR_09="#312e30"           # Bright Black
export COLOR_10="#d0913d"           # Bright Red (Command error)
export COLOR_11="#96a42d"           # Bright Green (Exec)
export COLOR_12="#a8a030"           # Bright Yellow
export COLOR_13="#8e9cc0"           # Bright Blue (Folder)
export COLOR_14="#d58888"           # Bright Magenta
export COLOR_15="#7aa880"           # Bright Cyan
export COLOR_16="#aeadaf"           # Bright White

export BACKGROUND_COLOR="#232323"   # Background
export FOREGROUND_COLOR="#aeadaf"   # Foreground (Text)

export CURSOR_COLOR="#aeadaf" # Cursor

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
