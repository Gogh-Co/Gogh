#!/usr/bin/env bash

export PROFILE_NAME="Mission Brogue"

export COLOR_01="#283139"           # Black (Host)
export COLOR_02="#EFA9A9"           # Red (Syntax string)
export COLOR_03="#8CD4B0"           # Green (Command)
export COLOR_04="#E0B88A"           # Yellow (Command second)
export COLOR_05="#A2C5FD"           # Blue (Path)
export COLOR_06="#CCB7DB"           # Magenta (Syntax var)
export COLOR_07="#93DFEC"           # Cyan (Prompt)
export COLOR_08="#93A5B4"           # White

export COLOR_09="#60778A"           # Bright Black
export COLOR_10="#F6BFBF"           # Bright Red (Command error)
export COLOR_11="#B5E090"           # Bright Green (Exec)
export COLOR_12="#FFF0B2"           # Bright Yellow
export COLOR_13="#C3D9FD"           # Bright Blue (Folder)
export COLOR_14="#E3C3E6"           # Bright Magenta
export COLOR_15="#B2F0FD"           # Bright Cyan
export COLOR_16="#E7EBEE"           # Bright White

export BACKGROUND_COLOR="#283139"   # Background
export FOREGROUND_COLOR="#93A5B4"   # Foreground (Text)

export CURSOR_COLOR="#93A5B4" # Cursor

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
