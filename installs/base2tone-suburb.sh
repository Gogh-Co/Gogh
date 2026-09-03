#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Suburb"

export COLOR_01="#1E202F"           # Black (Host)
export COLOR_02="#7586F5"           # Red (Syntax string)
export COLOR_03="#FB6FA9"           # Green (Command)
export COLOR_04="#FFB3D2"           # Yellow (Command second)
export COLOR_05="#8696FD"           # Blue (Path)
export COLOR_06="#FB6FA9"           # Magenta (Syntax var)
export COLOR_07="#A0ACFE"           # Cyan (Prompt)
export COLOR_08="#878BA6"           # White

export COLOR_09="#4F5472"           # Bright Black
export COLOR_10="#FE81B5"           # Bright Red (Command error)
export COLOR_11="#292C3D"           # Bright Green (Exec)
export COLOR_12="#444864"           # Bright Yellow
export COLOR_13="#5B6080"           # Bright Blue (Folder)
export COLOR_14="#D2D8FE"           # Bright Magenta
export COLOR_15="#F764A1"           # Bright Cyan
export COLOR_16="#EBEDFF"           # Bright White

export BACKGROUND_COLOR="#1E202F"   # Background
export FOREGROUND_COLOR="#878BA6"   # Foreground (Text)

export CURSOR_COLOR="#D14781" # Cursor

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
