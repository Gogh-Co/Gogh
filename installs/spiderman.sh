#!/usr/bin/env bash

export PROFILE_NAME="Spiderman"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#E60813"           # Red (Syntax string)
export COLOR_03="#E22928"           # Green (Command)
export COLOR_04="#E24756"           # Yellow (Command second)
export COLOR_05="#2C3FFF"           # Blue (Path)
export COLOR_06="#2435DB"           # Magenta (Syntax var)
export COLOR_07="#3256FF"           # Cyan (Prompt)
export COLOR_08="#FFFEF6"           # White

export COLOR_09="#505354"           # Bright Black
export COLOR_10="#FF0325"           # Bright Red (Command error)
export COLOR_11="#FF3338"           # Bright Green (Exec)
export COLOR_12="#FE3A35"           # Bright Yellow
export COLOR_13="#1D50FF"           # Bright Blue (Folder)
export COLOR_14="#747CFF"           # Bright Magenta
export COLOR_15="#6184FF"           # Bright Cyan
export COLOR_16="#FFFFF9"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
export FOREGROUND_COLOR="#E3E3E3"   # Foreground (Text)

export CURSOR_COLOR="#2C3FFF" # Cursor

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
