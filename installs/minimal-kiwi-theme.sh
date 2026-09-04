#!/usr/bin/env bash

export PROFILE_NAME="Minimal Kiwi Theme"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#F44747"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#6796E6"           # Blue (Path)
export COLOR_06="#F07178"           # Magenta (Syntax var)
export COLOR_07="#89DDFF"           # Cyan (Prompt)
export COLOR_08="#B2CCD6"           # White

export COLOR_09="#191919"           # Bright Black
export COLOR_10="#3D1212"           # Bright Red (Command error)
export COLOR_11="#1A2536"           # Bright Green (Exec)
export COLOR_12="#3D3019"           # Bright Yellow
export COLOR_13="#6796E6"           # Bright Blue (Folder)
export COLOR_14="#3D1D1F"           # Bright Magenta
export COLOR_15="#1F3538"           # Bright Cyan
export COLOR_16="#2B3236"           # Bright White

export BACKGROUND_COLOR="#212121"   # Background
export FOREGROUND_COLOR="#828989"   # Foreground (Text)

export CURSOR_COLOR="#828989" # Cursor

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
