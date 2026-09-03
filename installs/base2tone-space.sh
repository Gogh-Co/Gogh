#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Space"

export COLOR_01="#24242E"           # Black (Host)
export COLOR_02="#7676F4"           # Red (Syntax string)
export COLOR_03="#EC7336"           # Green (Command)
export COLOR_04="#FE8C52"           # Yellow (Command second)
export COLOR_05="#767693"           # Blue (Path)
export COLOR_06="#EC7336"           # Magenta (Syntax var)
export COLOR_07="#8A8AAD"           # Cyan (Prompt)
export COLOR_08="#A1A1B5"           # White

export COLOR_09="#5B5B76"           # Bright Black
export COLOR_10="#F37B3F"           # Bright Red (Command error)
export COLOR_11="#333342"           # Bright Green (Exec)
export COLOR_12="#515167"           # Bright Yellow
export COLOR_13="#737391"           # Bright Blue (Folder)
export COLOR_14="#CECEE3"           # Bright Magenta
export COLOR_15="#E66E33"           # Bright Cyan
export COLOR_16="#EBEBFF"           # Bright White

export BACKGROUND_COLOR="#24242E"   # Background
export FOREGROUND_COLOR="#A1A1B5"   # Foreground (Text)

export CURSOR_COLOR="#B25424" # Cursor

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
