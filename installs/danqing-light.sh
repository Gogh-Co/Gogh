#!/usr/bin/env bash

export PROFILE_NAME="Danqing Light"

export COLOR_01="#FCFEFD"           # Black (Host)
export COLOR_02="#F9906F"           # Red (Syntax string)
export COLOR_03="#8AB361"           # Green (Command)
export COLOR_04="#F0C239"           # Yellow (Command second)
export COLOR_05="#B0A4E3"           # Blue (Path)
export COLOR_06="#CCA4E3"           # Magenta (Syntax var)
export COLOR_07="#30DFF3"           # Cyan (Prompt)
export COLOR_08="#5A605D"           # White

export COLOR_09="#CAD8D2"           # Bright Black
export COLOR_10="#F9906F"           # Bright Red (Command error)
export COLOR_11="#8AB361"           # Bright Green (Exec)
export COLOR_12="#F0C239"           # Bright Yellow
export COLOR_13="#B0A4E3"           # Bright Blue (Folder)
export COLOR_14="#CCA4E3"           # Bright Magenta
export COLOR_15="#30DFF3"           # Bright Cyan
export COLOR_16="#2D302F"           # Bright White

export BACKGROUND_COLOR="#FCFEFD"   # Background
export FOREGROUND_COLOR="#5A605D"   # Foreground (Text)

export CURSOR_COLOR="#5A605D" # Cursor

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
