#!/usr/bin/env bash

export PROFILE_NAME="Keys Ocean Sunset"

export COLOR_01="#101927"           # Black (Host)
export COLOR_02="#E85A52"           # Red (Syntax string)
export COLOR_03="#4A9A72"           # Green (Command)
export COLOR_04="#E89A2E"           # Yellow (Command second)
export COLOR_05="#5288B8"           # Blue (Path)
export COLOR_06="#BC5090"           # Magenta (Syntax var)
export COLOR_07="#5EC8C8"           # Cyan (Prompt)
export COLOR_08="#A5B5D5"           # White

export COLOR_09="#344658"           # Bright Black
export COLOR_10="#FC9077"           # Bright Red (Command error)
export COLOR_11="#62C48E"           # Bright Green (Exec)
export COLOR_12="#FFCB9A"           # Bright Yellow
export COLOR_13="#5A8FD4"           # Bright Blue (Folder)
export COLOR_14="#FDBFDE"           # Bright Magenta
export COLOR_15="#7ED4E0"           # Bright Cyan
export COLOR_16="#FFF5BE"           # Bright White

export BACKGROUND_COLOR="#0A1018"   # Background
export FOREGROUND_COLOR="#B8C8DC"   # Foreground (Text)

export CURSOR_COLOR="#FC9077" # Cursor

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
