#!/usr/bin/env bash

export PROFILE_NAME="Floraverse"

export COLOR_01="#08002E"           # Black (Host)
export COLOR_02="#64002C"           # Red (Syntax string)
export COLOR_03="#5D731A"           # Green (Command)
export COLOR_04="#CD751C"           # Yellow (Command second)
export COLOR_05="#1D6DA1"           # Blue (Path)
export COLOR_06="#B7077E"           # Magenta (Syntax var)
export COLOR_07="#42A38C"           # Cyan (Prompt)
export COLOR_08="#F3E0B8"           # White

export COLOR_09="#331E4D"           # Bright Black
export COLOR_10="#D02063"           # Bright Red (Command error)
export COLOR_11="#B4CE59"           # Bright Green (Exec)
export COLOR_12="#FAC357"           # Bright Yellow
export COLOR_13="#40A4CF"           # Bright Blue (Folder)
export COLOR_14="#F12AAE"           # Bright Magenta
export COLOR_15="#62CAA8"           # Bright Cyan
export COLOR_16="#FFF5DB"           # Bright White

export BACKGROUND_COLOR="#0E0D15"   # Background
export FOREGROUND_COLOR="#DBD1B9"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
