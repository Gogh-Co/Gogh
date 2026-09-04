#!/usr/bin/env bash

export PROFILE_NAME="Darkviolet"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#A82EE6"           # Red (Syntax string)
export COLOR_03="#4595E6"           # Green (Command)
export COLOR_04="#F29DF2"           # Yellow (Command second)
export COLOR_05="#4136D9"           # Blue (Path)
export COLOR_06="#7E5CE6"           # Magenta (Syntax var)
export COLOR_07="#40DFFF"           # Cyan (Prompt)
export COLOR_08="#B08AE6"           # White

export COLOR_09="#593380"           # Bright Black
export COLOR_10="#A82EE6"           # Bright Red (Command error)
export COLOR_11="#4595E6"           # Bright Green (Exec)
export COLOR_12="#F29DF2"           # Bright Yellow
export COLOR_13="#4136D9"           # Bright Blue (Folder)
export COLOR_14="#7E5CE6"           # Bright Magenta
export COLOR_15="#40DFFF"           # Bright Cyan
export COLOR_16="#A366FF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#B08AE6"   # Foreground (Text)

export CURSOR_COLOR="#B08AE6" # Cursor

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
