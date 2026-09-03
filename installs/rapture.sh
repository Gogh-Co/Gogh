#!/usr/bin/env bash

export PROFILE_NAME="Rapture"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FC644D"           # Red (Syntax string)
export COLOR_03="#7AFDE1"           # Green (Command)
export COLOR_04="#FFF09B"           # Yellow (Command second)
export COLOR_05="#6C9BF5"           # Blue (Path)
export COLOR_06="#FF4FA1"           # Magenta (Syntax var)
export COLOR_07="#64E0FF"           # Cyan (Prompt)
export COLOR_08="#C0C9E5"           # White

export COLOR_09="#304B66"           # Bright Black
export COLOR_10="#FC644D"           # Bright Red (Command error)
export COLOR_11="#7AFDE1"           # Bright Green (Exec)
export COLOR_12="#FFF09B"           # Bright Yellow
export COLOR_13="#6C9BF5"           # Bright Blue (Folder)
export COLOR_14="#FF4FA1"           # Bright Magenta
export COLOR_15="#64E0FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#111E2A"   # Background
export FOREGROUND_COLOR="#C0C9E5"   # Foreground (Text)

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
