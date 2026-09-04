#!/usr/bin/env bash

export PROFILE_NAME="One Black"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E05561"           # Red (Syntax string)
export COLOR_03="#8CC265"           # Green (Command)
export COLOR_04="#E6B965"           # Yellow (Command second)
export COLOR_05="#4AA5F0"           # Blue (Path)
export COLOR_06="#C162DE"           # Magenta (Syntax var)
export COLOR_07="#42B3C2"           # Cyan (Prompt)
export COLOR_08="#ABB2BF"           # White

export COLOR_09="#545862"           # Bright Black
export COLOR_10="#FF616E"           # Bright Red (Command error)
export COLOR_11="#A5E075"           # Bright Green (Exec)
export COLOR_12="#F0A45D"           # Bright Yellow
export COLOR_13="#4DC4FF"           # Bright Blue (Folder)
export COLOR_14="#DE73FF"           # Bright Magenta
export COLOR_15="#4CD1E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#ABB2BF"   # Foreground (Text)

export CURSOR_COLOR="#ABB2BF" # Cursor

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
