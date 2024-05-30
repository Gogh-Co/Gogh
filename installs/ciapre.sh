#!/usr/bin/env bash

export PROFILE_NAME="Ciapre"

export COLOR_01="#181818"           # Black (Host)
export COLOR_02="#810009"           # Red (Syntax string)
export COLOR_03="#48513B"           # Green (Command)
export COLOR_04="#CC8B3F"           # Yellow (Command second)
export COLOR_05="#576D8C"           # Blue (Path)
export COLOR_06="#724D7C"           # Magenta (Syntax var)
export COLOR_07="#5C4F4B"           # Cyan (Prompt)
export COLOR_08="#AEA47F"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#AC3835"           # Bright Red (Command error)
export COLOR_11="#A6A75D"           # Bright Green (Exec)
export COLOR_12="#DCDF7C"           # Bright Yellow
export COLOR_13="#3097C6"           # Bright Blue (Folder)
export COLOR_14="#D33061"           # Bright Magenta
export COLOR_15="#F3DBB2"           # Bright Cyan
export COLOR_16="#F4F4F4"           # Bright White

export BACKGROUND_COLOR="#191C27"   # Background
export FOREGROUND_COLOR="#AEA47A"   # Foreground (Text)

export CURSOR_COLOR="#AEA47A" # Cursor

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
