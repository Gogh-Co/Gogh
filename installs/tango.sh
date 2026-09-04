#!/usr/bin/env bash

export PROFILE_NAME="Tango"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#4E9A06"           # Green (Command)
export COLOR_04="#C4A000"           # Yellow (Command second)
export COLOR_05="#3465A4"           # Blue (Path)
export COLOR_06="#75507B"           # Magenta (Syntax var)
export COLOR_07="#06989A"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#CC0000"           # Bright Red (Command error)
export COLOR_11="#4E9A06"           # Bright Green (Exec)
export COLOR_12="#C4A000"           # Bright Yellow
export COLOR_13="#3465A4"           # Bright Blue (Folder)
export COLOR_14="#75507B"           # Bright Magenta
export COLOR_15="#06989A"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#2E3436"   # Background
export FOREGROUND_COLOR="#D3D7CF"   # Foreground (Text)

export CURSOR_COLOR="#D3D7CF" # Cursor

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
