#!/usr/bin/env bash

export PROFILE_NAME="Macintosh"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DD0907"           # Red (Syntax string)
export COLOR_03="#1FB714"           # Green (Command)
export COLOR_04="#FBF305"           # Yellow (Command second)
export COLOR_05="#0000D3"           # Blue (Path)
export COLOR_06="#4700A5"           # Magenta (Syntax var)
export COLOR_07="#02ABEA"           # Cyan (Prompt)
export COLOR_08="#C0C0C0"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#DD0907"           # Bright Red (Command error)
export COLOR_11="#1FB714"           # Bright Green (Exec)
export COLOR_12="#FBF305"           # Bright Yellow
export COLOR_13="#0000D3"           # Bright Blue (Folder)
export COLOR_14="#4700A5"           # Bright Magenta
export COLOR_15="#02ABEA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#C0C0C0"   # Foreground (Text)

export CURSOR_COLOR="#C0C0C0" # Cursor

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
