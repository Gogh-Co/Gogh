#!/usr/bin/env bash

export PROFILE_NAME="Bespin"

export COLOR_01="#28211C"           # Black (Host)
export COLOR_02="#CF6A4C"           # Red (Syntax string)
export COLOR_03="#54BE0D"           # Green (Command)
export COLOR_04="#F9EE98"           # Yellow (Command second)
export COLOR_05="#5EA6EA"           # Blue (Path)
export COLOR_06="#9B859D"           # Magenta (Syntax var)
export COLOR_07="#AFC4DB"           # Cyan (Prompt)
export COLOR_08="#8A8986"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#CF6A4C"           # Bright Red (Command error)
export COLOR_11="#54BE0D"           # Bright Green (Exec)
export COLOR_12="#F9EE98"           # Bright Yellow
export COLOR_13="#5EA6EA"           # Bright Blue (Folder)
export COLOR_14="#9B859D"           # Bright Magenta
export COLOR_15="#AFC4DB"           # Bright Cyan
export COLOR_16="#BAAE9E"           # Bright White

export BACKGROUND_COLOR="#28211C"   # Background
export FOREGROUND_COLOR="#8A8986"   # Foreground (Text)

export CURSOR_COLOR="#8A8986" # Cursor

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
