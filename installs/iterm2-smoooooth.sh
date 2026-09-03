#!/usr/bin/env bash

export PROFILE_NAME="iTerm2 Smoooooth"

export COLOR_01="#14191E"           # Black (Host)
export COLOR_02="#B43C2A"           # Red (Syntax string)
export COLOR_03="#00C200"           # Green (Command)
export COLOR_04="#C7C400"           # Yellow (Command second)
export COLOR_05="#2744C7"           # Blue (Path)
export COLOR_06="#C040BE"           # Magenta (Syntax var)
export COLOR_07="#00C5C7"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#DD7975"           # Bright Red (Command error)
export COLOR_11="#58E790"           # Bright Green (Exec)
export COLOR_12="#ECE100"           # Bright Yellow
export COLOR_13="#A7ABF2"           # Bright Blue (Folder)
export COLOR_14="#E17EE1"           # Bright Magenta
export COLOR_15="#60FDFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#15191F"   # Background
export FOREGROUND_COLOR="#DCDCDC"   # Foreground (Text)

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
