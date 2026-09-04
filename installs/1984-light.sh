#!/usr/bin/env bash

export PROFILE_NAME="1984 Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF16B0"           # Red (Syntax string)
export COLOR_03="#00AF4F"           # Green (Command)
export COLOR_04="#FF8D01"           # Yellow (Command second)
export COLOR_05="#0098FD"           # Blue (Path)
export COLOR_06="#F806FA"           # Magenta (Syntax var)
export COLOR_07="#00B2BE"           # Cyan (Prompt)
export COLOR_08="#FEFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF16B0"           # Bright Red (Command error)
export COLOR_11="#00AF4F"           # Bright Green (Exec)
export COLOR_12="#FF8D01"           # Bright Yellow
export COLOR_13="#0098FD"           # Bright Blue (Folder)
export COLOR_14="#F806FA"           # Bright Magenta
export COLOR_15="#00B2BE"           # Bright Cyan
export COLOR_16="#FEFFFF"           # Bright White

export BACKGROUND_COLOR="#E4E5F5"   # Background
export FOREGROUND_COLOR="#19152C"   # Foreground (Text)

export CURSOR_COLOR="#19152C" # Cursor

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
