#!/usr/bin/env bash

export PROFILE_NAME="Boo Shnickle"

export COLOR_01="#191914"           # Black (Host)
export COLOR_02="#FFBFA5"           # Red (Syntax string)
export COLOR_03="#E7FF99"           # Green (Command)
export COLOR_04="#FFF299"           # Yellow (Command second)
export COLOR_05="#BFBFD9"           # Blue (Path)
export COLOR_06="#F2BFD9"           # Magenta (Syntax var)
export COLOR_07="#BFFFC5"           # Cyan (Prompt)
export COLOR_08="#BDBD97"           # White

export COLOR_09="#7C7C63"           # Bright Black
export COLOR_10="#FFBFA5"           # Bright Red (Command error)
export COLOR_11="#E7FF99"           # Bright Green (Exec)
export COLOR_12="#FFF299"           # Bright Yellow
export COLOR_13="#BFBFD9"           # Bright Blue (Folder)
export COLOR_14="#F2BFD9"           # Bright Magenta
export COLOR_15="#BFFFC5"           # Bright Cyan
export COLOR_16="#FFFFCC"           # Bright White

export BACKGROUND_COLOR="#191914"   # Background
export FOREGROUND_COLOR="#BDBD97"   # Foreground (Text)

export CURSOR_COLOR="#BDBD97" # Cursor

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
