#!/usr/bin/env bash

export PROFILE_NAME="Modus Vivendi Tritanopia"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF5F59"           # Red (Syntax string)
export COLOR_03="#44BC44"           # Green (Command)
export COLOR_04="#CABF00"           # Yellow (Command second)
export COLOR_05="#2FAFFF"           # Blue (Path)
export COLOR_06="#FEACD0"           # Magenta (Syntax var)
export COLOR_07="#00D3D0"           # Cyan (Prompt)
export COLOR_08="#A6A6A6"           # White

export COLOR_09="#595959"           # Bright Black
export COLOR_10="#FF6740"           # Bright Red (Command error)
export COLOR_11="#00C06F"           # Bright Green (Exec)
export COLOR_12="#FFA00F"           # Bright Yellow
export COLOR_13="#79A8FF"           # Bright Blue (Folder)
export COLOR_14="#B6A0FF"           # Bright Magenta
export COLOR_15="#6AE4B9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
