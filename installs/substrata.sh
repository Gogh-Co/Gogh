#!/usr/bin/env bash

export PROFILE_NAME="Substrata"

export COLOR_01="#2E313D"           # Black (Host)
export COLOR_02="#CF8164"           # Red (Syntax string)
export COLOR_03="#76A065"           # Green (Command)
export COLOR_04="#AB924C"           # Yellow (Command second)
export COLOR_05="#8296B0"           # Blue (Path)
export COLOR_06="#A18DAF"           # Magenta (Syntax var)
export COLOR_07="#659EA2"           # Cyan (Prompt)
export COLOR_08="#B5B4C9"           # White

export COLOR_09="#5B5F71"           # Bright Black
export COLOR_10="#FE9F7C"           # Bright Red (Command error)
export COLOR_11="#92C47E"           # Bright Green (Exec)
export COLOR_12="#D2B45F"           # Bright Yellow
export COLOR_13="#A0B9D8"           # Bright Blue (Folder)
export COLOR_14="#C6AED7"           # Bright Magenta
export COLOR_15="#7DC2C7"           # Bright Cyan
export COLOR_16="#F0ECFE"           # Bright White

export BACKGROUND_COLOR="#191C25"   # Background
export FOREGROUND_COLOR="#B5B4C9"   # Foreground (Text)

export CURSOR_COLOR="#B5B4C9" # Cursor

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
