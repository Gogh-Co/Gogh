#!/usr/bin/env bash

export PROFILE_NAME="Papercolor Dark"

export COLOR_01="#1C1C1C"           # Black (Host)
export COLOR_02="#AF005F"           # Red (Syntax string)
export COLOR_03="#5FAF00"           # Green (Command)
export COLOR_04="#D7AF5F"           # Yellow (Command second)
export COLOR_05="#5FAFD7"           # Blue (Path)
export COLOR_06="#808080"           # Magenta (Syntax var)
export COLOR_07="#D7875F"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#5FAF5F"           # Bright Red (Command error)
export COLOR_11="#AFD700"           # Bright Green (Exec)
export COLOR_12="#AF87D7"           # Bright Yellow
export COLOR_13="#FFAF00"           # Bright Blue (Folder)
export COLOR_14="#FF5FAF"           # Bright Magenta
export COLOR_15="#00AFAF"           # Bright Cyan
export COLOR_16="#5F8787"           # Bright White

export BACKGROUND_COLOR="#1C1C1C"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
