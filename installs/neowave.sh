#!/usr/bin/env bash

export PROFILE_NAME="Neowave"

export COLOR_01="#123E7C"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#DF00DF"           # Green (Command)
export COLOR_04="#FF7F00"           # Yellow (Command second)
export COLOR_05="#00FF00"           # Blue (Path)
export COLOR_06="#C11CD1"           # Magenta (Syntax var)
export COLOR_07="#0AFDF6"           # Cyan (Prompt)
export COLOR_08="#D7D7D5"           # White

export COLOR_09="#1C61C2"           # Bright Black
export COLOR_10="#FF0000"           # Bright Red (Command error)
export COLOR_11="#DF00DF"           # Bright Green (Exec)
export COLOR_12="#FF7F00"           # Bright Yellow
export COLOR_13="#00FF00"           # Bright Blue (Folder)
export COLOR_14="#711C91"           # Bright Magenta
export COLOR_15="#0AFDF6"           # Bright Cyan
export COLOR_16="#D7D7D5"           # Bright White

export BACKGROUND_COLOR="#161021"   # Background
export FOREGROUND_COLOR="#00FFFF"   # Foreground (Text)

export CURSOR_COLOR="#00FFFF" # Cursor

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
