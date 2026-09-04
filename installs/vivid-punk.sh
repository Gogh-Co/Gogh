#!/usr/bin/env bash

export PROFILE_NAME="Vivid Punk"

export COLOR_01="#010101"           # Black (Host)
export COLOR_02="#A32522"           # Red (Syntax string)
export COLOR_03="#115A24"           # Green (Command)
export COLOR_04="#D5A243"           # Yellow (Command second)
export COLOR_05="#263788"           # Blue (Path)
export COLOR_06="#793664"           # Magenta (Syntax var)
export COLOR_07="#128CA1"           # Cyan (Prompt)
export COLOR_08="#DADAD7"           # White

export COLOR_09="#757575"           # Bright Black
export COLOR_10="#D53B3E"           # Bright Red (Command error)
export COLOR_11="#0A8439"           # Bright Green (Exec)
export COLOR_12="#F5BF59"           # Bright Yellow
export COLOR_13="#6C85E8"           # Bright Blue (Folder)
export COLOR_14="#B75492"           # Bright Magenta
export COLOR_15="#7ACCD4"           # Bright Cyan
export COLOR_16="#F3F3F2"           # Bright White

export BACKGROUND_COLOR="#171A26"   # Background
export FOREGROUND_COLOR="#F88132"   # Foreground (Text)

export CURSOR_COLOR="#F88132" # Cursor

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
