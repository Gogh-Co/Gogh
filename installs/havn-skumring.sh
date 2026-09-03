#!/usr/bin/env bash

export PROFILE_NAME="Havn Skumring"

export COLOR_01="#262C45"           # Black (Host)
export COLOR_02="#D96048"           # Red (Syntax string)
export COLOR_03="#7CAB7F"           # Green (Command)
export COLOR_04="#EEB64E"           # Yellow (Command second)
export COLOR_05="#5D6BEF"           # Blue (Path)
export COLOR_06="#7A729A"           # Magenta (Syntax var)
export COLOR_07="#CA8CBE"           # Cyan (Prompt)
export COLOR_08="#DDE0ED"           # White

export COLOR_09="#212840"           # Bright Black
export COLOR_10="#C47768"           # Bright Red (Command error)
export COLOR_11="#8F9D90"           # Bright Green (Exec)
export COLOR_12="#E4C693"           # Bright Yellow
export COLOR_13="#5D85C6"           # Bright Blue (Folder)
export COLOR_14="#967DE7"           # Bright Magenta
export COLOR_15="#C57EB3"           # Bright Cyan
export COLOR_16="#FDF6E3"           # Bright White

export BACKGROUND_COLOR="#121521"   # Background
export FOREGROUND_COLOR="#D7DBEA"   # Foreground (Text)

export CURSOR_COLOR="#40786F" # Cursor

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
