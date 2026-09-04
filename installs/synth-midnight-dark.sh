#!/usr/bin/env bash

export PROFILE_NAME="Synth Midnight Dark"

export COLOR_01="#050608"           # Black (Host)
export COLOR_02="#B53B50"           # Red (Syntax string)
export COLOR_03="#06EA61"           # Green (Command)
export COLOR_04="#C9D364"           # Yellow (Command second)
export COLOR_05="#03AEFF"           # Blue (Path)
export COLOR_06="#EA5CE2"           # Magenta (Syntax var)
export COLOR_07="#42FFF9"           # Cyan (Prompt)
export COLOR_08="#C1C3C4"           # White

export COLOR_09="#474849"           # Bright Black
export COLOR_10="#B53B50"           # Bright Red (Command error)
export COLOR_11="#06EA61"           # Bright Green (Exec)
export COLOR_12="#C9D364"           # Bright Yellow
export COLOR_13="#03AEFF"           # Bright Blue (Folder)
export COLOR_14="#EA5CE2"           # Bright Magenta
export COLOR_15="#42FFF9"           # Bright Cyan
export COLOR_16="#DDDFE0"           # Bright White

export BACKGROUND_COLOR="#050608"   # Background
export FOREGROUND_COLOR="#C1C3C4"   # Foreground (Text)

export CURSOR_COLOR="#C1C3C4" # Cursor

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
