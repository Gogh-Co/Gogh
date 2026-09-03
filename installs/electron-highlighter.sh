#!/usr/bin/env bash

export PROFILE_NAME="Electron Highlighter"

export COLOR_01="#15161E"           # Black (Host)
export COLOR_02="#F7768E"           # Red (Syntax string)
export COLOR_03="#58FFC7"           # Green (Command)
export COLOR_04="#FFECB8"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#D2A6EF"           # Magenta (Syntax var)
export COLOR_07="#5CE1FF"           # Cyan (Prompt)
export COLOR_08="#7586B3"           # White

export COLOR_09="#4E5B88"           # Bright Black
export COLOR_10="#F7768E"           # Bright Red (Command error)
export COLOR_11="#58FFC7"           # Bright Green (Exec)
export COLOR_12="#FFECB8"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#D2A6EF"           # Bright Magenta
export COLOR_15="#5CE1FF"           # Bright Cyan
export COLOR_16="#C5CDE0"           # Bright White

export BACKGROUND_COLOR="#24283B"   # Background
export FOREGROUND_COLOR="#A8B5D1"   # Foreground (Text)

export CURSOR_COLOR="#A8B5D1" # Cursor

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
