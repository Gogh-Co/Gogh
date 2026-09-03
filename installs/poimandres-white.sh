#!/usr/bin/env bash

export PROFILE_NAME="Poimandres White"

export COLOR_01="#FEFEFF"           # Black (Host)
export COLOR_02="#FF2090"           # Red (Syntax string)
export COLOR_03="#01DAB2"           # Green (Command)
export COLOR_04="#E5BA4E"           # Yellow (Command second)
export COLOR_05="#8ABACD"           # Blue (Path)
export COLOR_06="#EB8394"           # Magenta (Syntax var)
export COLOR_07="#8ABACD"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#969CBD"           # Bright Black
export COLOR_10="#FF2090"           # Bright Red (Command error)
export COLOR_11="#01DAB2"           # Bright Green (Exec)
export COLOR_12="#E5BA4E"           # Bright Yellow
export COLOR_13="#0EBFFF"           # Bright Blue (Folder)
export COLOR_14="#EB8394"           # Bright Magenta
export COLOR_15="#0EBFFF"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FEFEFF"   # Background
export FOREGROUND_COLOR="#969CBD"   # Foreground (Text)

export CURSOR_COLOR="#969CBD" # Cursor

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
