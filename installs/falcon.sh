#!/usr/bin/env bash

export PROFILE_NAME="Falcon"

export COLOR_01="#000004"           # Black (Host)
export COLOR_02="#FF3600"           # Red (Syntax string)
export COLOR_03="#718E3F"           # Green (Command)
export COLOR_04="#FFC552"           # Yellow (Command second)
export COLOR_05="#635196"           # Blue (Path)
export COLOR_06="#FF761A"           # Magenta (Syntax var)
export COLOR_07="#34BFA4"           # Cyan (Prompt)
export COLOR_08="#B4B4B9"           # White

export COLOR_09="#020221"           # Bright Black
export COLOR_10="#FF8E78"           # Bright Red (Command error)
export COLOR_11="#B1BF75"           # Bright Green (Exec)
export COLOR_12="#FFD392"           # Bright Yellow
export COLOR_13="#99A4BC"           # Bright Blue (Folder)
export COLOR_14="#FFB07B"           # Bright Magenta
export COLOR_15="#8BCCBF"           # Bright Cyan
export COLOR_16="#F8F8FF"           # Bright White

export BACKGROUND_COLOR="#020221"   # Background
export FOREGROUND_COLOR="#B4B4B9"   # Foreground (Text)

export CURSOR_COLOR="#B4B4B9" # Cursor

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
