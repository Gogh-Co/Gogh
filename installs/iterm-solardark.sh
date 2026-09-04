#!/usr/bin/env bash

export PROFILE_NAME="Iterm Solardark"

export COLOR_01="#003440"           # Black (Host)
export COLOR_02="#DC312E"           # Red (Syntax string)
export COLOR_03="#7CC67F"           # Green (Command)
export COLOR_04="#B58900"           # Yellow (Command second)
export COLOR_05="#268AD2"           # Blue (Path)
export COLOR_06="#D33582"           # Magenta (Syntax var)
export COLOR_07="#2AA197"           # Cyan (Prompt)
export COLOR_08="#EEE8D5"           # White

export COLOR_09="#00779A"           # Bright Black
export COLOR_10="#F9314B"           # Bright Red (Command error)
export COLOR_11="#5BEE96"           # Bright Green (Exec)
export COLOR_12="#C08F34"           # Bright Yellow
export COLOR_13="#109FD2"           # Bright Blue (Folder)
export COLOR_14="#E9679F"           # Bright Magenta
export COLOR_15="#00BDAE"           # Bright Cyan
export COLOR_16="#FDF6E3"           # Bright White

export BACKGROUND_COLOR="#002833"   # Background
export FOREGROUND_COLOR="#A5ABB6"   # Foreground (Text)

export CURSOR_COLOR="#A5ABB6" # Cursor

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
