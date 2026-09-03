#!/usr/bin/env bash

export PROFILE_NAME="Tempus Classic"

export COLOR_01="#232323"           # Black (Host)
export COLOR_02="#D4823D"           # Red (Syntax string)
export COLOR_03="#8C9E3D"           # Green (Command)
export COLOR_04="#B1942B"           # Yellow (Command second)
export COLOR_05="#6E9CB0"           # Blue (Path)
export COLOR_06="#B58D88"           # Magenta (Syntax var)
export COLOR_07="#6DA280"           # Cyan (Prompt)
export COLOR_08="#949D9F"           # White

export COLOR_09="#312E30"           # Bright Black
export COLOR_10="#D0913D"           # Bright Red (Command error)
export COLOR_11="#96A42D"           # Bright Green (Exec)
export COLOR_12="#A8A030"           # Bright Yellow
export COLOR_13="#8E9CC0"           # Bright Blue (Folder)
export COLOR_14="#D58888"           # Bright Magenta
export COLOR_15="#7AA880"           # Bright Cyan
export COLOR_16="#AEADAF"           # Bright White

export BACKGROUND_COLOR="#232323"   # Background
export FOREGROUND_COLOR="#AEADAF"   # Foreground (Text)

export CURSOR_COLOR="#AEADAF" # Cursor

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
