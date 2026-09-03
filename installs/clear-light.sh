#!/usr/bin/env bash

export PROFILE_NAME="Clear Light"

export COLOR_01="#2D3840"           # Black (Host)
export COLOR_02="#B45648"           # Red (Syntax string)
export COLOR_03="#6CAA71"           # Green (Command)
export COLOR_04="#C4AC62"           # Yellow (Command second)
export COLOR_05="#5685A8"           # Blue (Path)
export COLOR_06="#AD64BE"           # Magenta (Syntax var)
export COLOR_07="#69C6C9"           # Cyan (Prompt)
export COLOR_08="#B4BBBF"           # White

export COLOR_09="#506573"           # Bright Black
export COLOR_10="#DF6C5A"           # Bright Red (Command error)
export COLOR_11="#79BE7E"           # Bright Green (Exec)
export COLOR_12="#D8BB65"           # Bright Yellow
export COLOR_13="#49A2E1"           # Bright Blue (Folder)
export COLOR_14="#D389E5"           # Bright Magenta
export COLOR_15="#5EC7CB"           # Bright Cyan
export COLOR_16="#D8E1E7"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#3A4851"   # Foreground (Text)

export CURSOR_COLOR="#919191" # Cursor

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
