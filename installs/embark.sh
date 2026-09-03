#!/usr/bin/env bash

export PROFILE_NAME="Embark"

export COLOR_01="#1E1C31"           # Black (Host)
export COLOR_02="#F0719B"           # Red (Syntax string)
export COLOR_03="#A1EFD3"           # Green (Command)
export COLOR_04="#FFE9AA"           # Yellow (Command second)
export COLOR_05="#57C7FF"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#87DFEB"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#585273"           # Bright Black
export COLOR_10="#F02E6E"           # Bright Red (Command error)
export COLOR_11="#2CE592"           # Bright Green (Exec)
export COLOR_12="#FFB378"           # Bright Yellow
export COLOR_13="#1DA0E2"           # Bright Blue (Folder)
export COLOR_14="#A742EA"           # Bright Magenta
export COLOR_15="#63F2F1"           # Bright Cyan
export COLOR_16="#A6B3CC"           # Bright White

export BACKGROUND_COLOR="#1E1C31"   # Background
export FOREGROUND_COLOR="#EEFFFF"   # Foreground (Text)

export CURSOR_COLOR="#A1EFD3" # Cursor

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
