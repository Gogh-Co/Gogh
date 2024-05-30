#!/usr/bin/env bash

export PROFILE_NAME="Miramare"

export COLOR_01="#242021"           # Black (Host)
export COLOR_02="#e68183"           # Red (Syntax string)
export COLOR_03="#a7c080"           # Green (Command)
export COLOR_04="#d9bb80"           # Yellow (Command second)
export COLOR_05="#89beba"           # Blue (Path)
export COLOR_06="#d3a0bc"           # Magenta (Syntax var)
export COLOR_07="#87c095"           # Cyan (Prompt)
export COLOR_08="#d8caac"           # White

export COLOR_09="#444444"           # Bright Black
export COLOR_10="#e39b7b"           # Bright Red (Command error)
export COLOR_11="#a7c080"           # Bright Green (Exec)
export COLOR_12="#d9bb80"           # Bright Yellow
export COLOR_13="#89beba"           # Bright Blue (Folder)
export COLOR_14="#d3a0bc"           # Bright Magenta
export COLOR_15="#87c095"           # Bright Cyan
export COLOR_16="#e6d6ac"           # Bright White

export BACKGROUND_COLOR="#2a2426"   # Background
export FOREGROUND_COLOR="#e6d6ac"   # Foreground (Text)

export CURSOR_COLOR="#e6d6ac" # Cursor

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
