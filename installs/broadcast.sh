#!/usr/bin/env bash

export PROFILE_NAME="Broadcast"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DA4939"           # Red (Syntax string)
export COLOR_03="#519F50"           # Green (Command)
export COLOR_04="#FFD24A"           # Yellow (Command second)
export COLOR_05="#6D9CBE"           # Blue (Path)
export COLOR_06="#D0D0FF"           # Magenta (Syntax var)
export COLOR_07="#6E9CBE"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#FF7B6B"           # Bright Red (Command error)
export COLOR_11="#83D182"           # Bright Green (Exec)
export COLOR_12="#FFFF7C"           # Bright Yellow
export COLOR_13="#9FCEF0"           # Bright Blue (Folder)
export COLOR_14="#FFFFFF"           # Bright Magenta
export COLOR_15="#A0CEF0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2B2B2B"   # Background
export FOREGROUND_COLOR="#E6E1DC"   # Foreground (Text)

export CURSOR_COLOR="#E6E1DC" # Cursor

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
