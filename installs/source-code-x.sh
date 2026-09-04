#!/usr/bin/env bash

export PROFILE_NAME="Source Code X"

export COLOR_01="#4E596B"           # Black (Host)
export COLOR_02="#FB695D"           # Red (Syntax string)
export COLOR_03="#74B391"           # Green (Command)
export COLOR_04="#FC8E3E"           # Yellow (Command second)
export COLOR_05="#9586F4"           # Blue (Path)
export COLOR_06="#FB5EA3"           # Magenta (Syntax var)
export COLOR_07="#79C8B6"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#91A0B1"           # Bright Black
export COLOR_10="#FB695D"           # Bright Red (Command error)
export COLOR_11="#AEF37C"           # Bright Green (Exec)
export COLOR_12="#FC8E3E"           # Bright Yellow
export COLOR_13="#53A4FB"           # Bright Blue (Folder)
export COLOR_14="#FB5EA3"           # Bright Magenta
export COLOR_15="#83D2C0"           # Bright Cyan
export COLOR_16="#91A0B1"           # Bright White

export BACKGROUND_COLOR="#1F1F24"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
