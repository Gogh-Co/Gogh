#!/usr/bin/env bash

export PROFILE_NAME="Vice"

export COLOR_01="#17191E"           # Black (Host)
export COLOR_02="#FF29A8"           # Red (Syntax string)
export COLOR_03="#0BADFF"           # Green (Command)
export COLOR_04="#F0FFAA"           # Yellow (Command second)
export COLOR_05="#00EAFF"           # Blue (Path)
export COLOR_06="#00F6D9"           # Magenta (Syntax var)
export COLOR_07="#8265FF"           # Cyan (Prompt)
export COLOR_08="#8B9CBE"           # White

export COLOR_09="#383A47"           # Bright Black
export COLOR_10="#FF29A8"           # Bright Red (Command error)
export COLOR_11="#0BADFF"           # Bright Green (Exec)
export COLOR_12="#F0FFAA"           # Bright Yellow
export COLOR_13="#00EAFF"           # Bright Blue (Folder)
export COLOR_14="#00F6D9"           # Bright Magenta
export COLOR_15="#8265FF"           # Bright Cyan
export COLOR_16="#F4F4F7"           # Bright White

export BACKGROUND_COLOR="#17191E"   # Background
export FOREGROUND_COLOR="#8B9CBE"   # Foreground (Text)

export CURSOR_COLOR="#8B9CBE" # Cursor

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
