#!/usr/bin/env bash

export PROFILE_NAME="Overnight Slumber"

export COLOR_01="#0A1222"           # Black (Host)
export COLOR_02="#FFA7C4"           # Red (Syntax string)
export COLOR_03="#85CC95"           # Green (Command)
export COLOR_04="#FFCB8B"           # Yellow (Command second)
export COLOR_05="#8DABE1"           # Blue (Path)
export COLOR_06="#C792EB"           # Magenta (Syntax var)
export COLOR_07="#78CCF0"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#FFA7C4"           # Bright Red (Command error)
export COLOR_11="#85CC95"           # Bright Green (Exec)
export COLOR_12="#FFCB8B"           # Bright Yellow
export COLOR_13="#8DABE1"           # Bright Blue (Folder)
export COLOR_14="#C792EB"           # Bright Magenta
export COLOR_15="#FFA7C4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E1729"   # Background
export FOREGROUND_COLOR="#CED2D6"   # Foreground (Text)

export CURSOR_COLOR="#FFA7C4" # Cursor

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
