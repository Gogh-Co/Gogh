#!/usr/bin/env bash

export PROFILE_NAME="Helsinki"

export COLOR_01="#F8FAFE"           # Black (Host)
export COLOR_02="#1FAA9E"           # Red (Syntax string)
export COLOR_03="#733D9A"           # Green (Command)
export COLOR_04="#2E70AD"           # Yellow (Command second)
export COLOR_05="#B55A0F"           # Blue (Path)
export COLOR_06="#3E9D21"           # Magenta (Syntax var)
export COLOR_07="#BD4C3D"           # Cyan (Prompt)
export COLOR_08="#544D40"           # White

export COLOR_09="#B0A999"           # Bright Black
export COLOR_10="#009E91"           # Bright Red (Command error)
export COLOR_11="#5A1F8A"           # Bright Green (Exec)
export COLOR_12="#0F5BA2"           # Bright Yellow
export COLOR_13="#B23B00"           # Bright Blue (Folder)
export COLOR_14="#218C00"           # Bright Magenta
export COLOR_15="#B32E1F"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#F8FAFE"   # Background
export FOREGROUND_COLOR="#544D40"   # Foreground (Text)

export CURSOR_COLOR="#544D40" # Cursor

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
