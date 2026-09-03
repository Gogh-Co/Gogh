#!/usr/bin/env bash

export PROFILE_NAME="Duotone Dark"

export COLOR_01="#1F1D27"           # Black (Host)
export COLOR_02="#D9393E"           # Red (Syntax string)
export COLOR_03="#2DCD73"           # Green (Command)
export COLOR_04="#D9B76E"           # Yellow (Command second)
export COLOR_05="#FFC284"           # Blue (Path)
export COLOR_06="#DE8D40"           # Magenta (Syntax var)
export COLOR_07="#2488FF"           # Cyan (Prompt)
export COLOR_08="#B7A1FF"           # White

export COLOR_09="#353147"           # Bright Black
export COLOR_10="#D9393E"           # Bright Red (Command error)
export COLOR_11="#2DCD73"           # Bright Green (Exec)
export COLOR_12="#D9B76E"           # Bright Yellow
export COLOR_13="#FFC284"           # Bright Blue (Folder)
export COLOR_14="#DE8D40"           # Bright Magenta
export COLOR_15="#2488FF"           # Bright Cyan
export COLOR_16="#EAE5FF"           # Bright White

export BACKGROUND_COLOR="#1F1D27"   # Background
export FOREGROUND_COLOR="#B7A1FF"   # Foreground (Text)

export CURSOR_COLOR="#FF9839" # Cursor

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
