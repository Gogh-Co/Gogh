#!/usr/bin/env bash

export PROFILE_NAME="Aci"

export COLOR_01="#363636"           # Black (Host)
export COLOR_02="#FF0883"           # Red (Syntax string)
export COLOR_03="#83FF08"           # Green (Command)
export COLOR_04="#FF8308"           # Yellow (Command second)
export COLOR_05="#0883FF"           # Blue (Path)
export COLOR_06="#8308FF"           # Magenta (Syntax var)
export COLOR_07="#08FF83"           # Cyan (Prompt)
export COLOR_08="#B6B6B6"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#FF1E8E"           # Bright Red (Command error)
export COLOR_11="#8EFF1E"           # Bright Green (Exec)
export COLOR_12="#FF8E1E"           # Bright Yellow
export COLOR_13="#1E8EFF"           # Bright Blue (Folder)
export COLOR_14="#8E1EFF"           # Bright Magenta
export COLOR_15="#1EFF8E"           # Bright Cyan
export COLOR_16="#C2C2C2"           # Bright White

export BACKGROUND_COLOR="#0D1926"   # Background
export FOREGROUND_COLOR="#B4E1FD"   # Foreground (Text)

export CURSOR_COLOR="#B4E1FD" # Cursor

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
