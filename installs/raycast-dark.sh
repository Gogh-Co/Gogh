#!/usr/bin/env bash

export PROFILE_NAME="Raycast Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF5360"           # Red (Syntax string)
export COLOR_03="#59D499"           # Green (Command)
export COLOR_04="#FFC531"           # Yellow (Command second)
export COLOR_05="#56C2FF"           # Blue (Path)
export COLOR_06="#CF2F98"           # Magenta (Syntax var)
export COLOR_07="#52EEE5"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF6363"           # Bright Red (Command error)
export COLOR_11="#59D499"           # Bright Green (Exec)
export COLOR_12="#FFC531"           # Bright Yellow
export COLOR_13="#56C2FF"           # Bright Blue (Folder)
export COLOR_14="#CF2F98"           # Bright Magenta
export COLOR_15="#52EEE5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

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
