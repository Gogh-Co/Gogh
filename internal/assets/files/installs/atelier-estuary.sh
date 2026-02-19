#!/usr/bin/env bash

export PROFILE_NAME="Atelier Estuary"

export COLOR_01="#22221B"           # Black (Host)
export COLOR_02="#BA6236"           # Red (Syntax string)
export COLOR_03="#7D9726"           # Green (Command)
export COLOR_04="#A5980D"           # Yellow (Command second)
export COLOR_05="#36A166"           # Blue (Path)
export COLOR_06="#5F9182"           # Magenta (Syntax var)
export COLOR_07="#5B9D48"           # Cyan (Prompt)
export COLOR_08="#929181"           # White

export COLOR_09="#6C6B5A"           # Bright Black
export COLOR_10="#AE7313"           # Bright Red (Command error)
export COLOR_11="#7D9726"           # Bright Green (Exec)
export COLOR_12="#A5980D"           # Bright Yellow
export COLOR_13="#36A166"           # Bright Blue (Folder)
export COLOR_14="#5F9182"           # Bright Magenta
export COLOR_15="#5B9D48"           # Bright Cyan
export COLOR_16="#F4F3EC"           # Bright White

export BACKGROUND_COLOR="#22221B"   # Background
export FOREGROUND_COLOR="#878573"   # Foreground (Text)

export CURSOR_COLOR="#878573" # Cursor

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
