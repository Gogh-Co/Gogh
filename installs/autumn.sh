#!/usr/bin/env bash

export PROFILE_NAME="Autumn"

export COLOR_01="#212121"           # Black (Host)
export COLOR_02="#F05E48"           # Red (Syntax string)
export COLOR_03="#99BE70"           # Green (Command)
export COLOR_04="#FAD566"           # Yellow (Command second)
export COLOR_05="#86C1B9"           # Blue (Path)
export COLOR_06="#CFBA8B"           # Magenta (Syntax var)
export COLOR_07="#72A59E"           # Cyan (Prompt)
export COLOR_08="#C8C8C8"           # White

export COLOR_09="#404040"           # Bright Black
export COLOR_10="#F05E48"           # Bright Red (Command error)
export COLOR_11="#99BE70"           # Bright Green (Exec)
export COLOR_12="#FFFF9F"           # Bright Yellow
export COLOR_13="#86C1B9"           # Bright Blue (Folder)
export COLOR_14="#CFBA8B"           # Bright Magenta
export COLOR_15="#72A59E"           # Bright Cyan
export COLOR_16="#E8E8E8"           # Bright White

export BACKGROUND_COLOR="#232323"   # Background
export FOREGROUND_COLOR="#F3F2CC"   # Foreground (Text)

export CURSOR_COLOR="#F3F2CC" # Cursor

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
