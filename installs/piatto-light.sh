#!/usr/bin/env bash

export PROFILE_NAME="Piatto Light"

export COLOR_01="#414141"           # Black (Host)
export COLOR_02="#B23771"           # Red (Syntax string)
export COLOR_03="#66781E"           # Green (Command)
export COLOR_04="#CD6F34"           # Yellow (Command second)
export COLOR_05="#3C5EA8"           # Blue (Path)
export COLOR_06="#A454B2"           # Magenta (Syntax var)
export COLOR_07="#66781E"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#3F3F3F"           # Bright Black
export COLOR_10="#DB3365"           # Bright Red (Command error)
export COLOR_11="#829429"           # Bright Green (Exec)
export COLOR_12="#CD6F34"           # Bright Yellow
export COLOR_13="#3C5EA8"           # Bright Blue (Folder)
export COLOR_14="#A454B2"           # Bright Magenta
export COLOR_15="#829429"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#414141"   # Foreground (Text)

export CURSOR_COLOR="#5E77C8" # Cursor

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
