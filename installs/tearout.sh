#!/usr/bin/env bash

export PROFILE_NAME="Tearout"

export COLOR_01="#685742"           # Black (Host)
export COLOR_02="#CC967B"           # Red (Syntax string)
export COLOR_03="#97976D"           # Green (Command)
export COLOR_04="#6C9861"           # Yellow (Command second)
export COLOR_05="#B5955E"           # Blue (Path)
export COLOR_06="#C9A554"           # Magenta (Syntax var)
export COLOR_07="#D7C483"           # Cyan (Prompt)
export COLOR_08="#B5955E"           # White

export COLOR_09="#75644F"           # Bright Black
export COLOR_10="#CC967B"           # Bright Red (Command error)
export COLOR_11="#97976D"           # Bright Green (Exec)
export COLOR_12="#6C9861"           # Bright Yellow
export COLOR_13="#B5955E"           # Bright Blue (Folder)
export COLOR_14="#C9A554"           # Bright Magenta
export COLOR_15="#D7C483"           # Bright Cyan
export COLOR_16="#B5955E"           # Bright White

export BACKGROUND_COLOR="#34392D"   # Background
export FOREGROUND_COLOR="#F4D2AE"   # Foreground (Text)

export CURSOR_COLOR="#D7C483" # Cursor

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
