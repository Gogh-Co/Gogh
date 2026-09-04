#!/usr/bin/env bash

export PROFILE_NAME="Kurayami"

export COLOR_01="#2C2C2C"           # Black (Host)
export COLOR_02="#BF616A"           # Red (Syntax string)
export COLOR_03="#00AF87"           # Green (Command)
export COLOR_04="#CECB00"           # Yellow (Command second)
export COLOR_05="#158C8A"           # Blue (Path)
export COLOR_06="#B48EAD"           # Magenta (Syntax var)
export COLOR_07="#1A8FFF"           # Cyan (Prompt)
export COLOR_08="#DCDCDC"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#B2201F"           # Bright Red (Command error)
export COLOR_11="#36F57A"           # Bright Green (Exec)
export COLOR_12="#FFFD00"           # Bright Yellow
export COLOR_13="#1A8FFF"           # Bright Blue (Folder)
export COLOR_14="#CB1ED1"           # Bright Magenta
export COLOR_15="#14FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1C1C1C"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
