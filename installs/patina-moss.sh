#!/usr/bin/env bash

export PROFILE_NAME="Patina Moss"

export COLOR_01="#33362E"           # Black (Host)
export COLOR_02="#C07878"           # Red (Syntax string)
export COLOR_03="#5BA886"           # Green (Command)
export COLOR_04="#D4BF6E"           # Yellow (Command second)
export COLOR_05="#65A8B5"           # Blue (Path)
export COLOR_06="#C08A7D"           # Magenta (Syntax var)
export COLOR_07="#63A8A6"           # Cyan (Prompt)
export COLOR_08="#DBD7CA"           # White

export COLOR_09="#585B51"           # Bright Black
export COLOR_10="#C07878"           # Bright Red (Command error)
export COLOR_11="#5BA886"           # Bright Green (Exec)
export COLOR_12="#D4BF6E"           # Bright Yellow
export COLOR_13="#65A8B5"           # Bright Blue (Folder)
export COLOR_14="#C08A7D"           # Bright Magenta
export COLOR_15="#63A8A6"           # Bright Cyan
export COLOR_16="#DBD7CA"           # Bright White

export BACKGROUND_COLOR="#20231F"   # Background
export FOREGROUND_COLOR="#DBD7CA"   # Foreground (Text)

export CURSOR_COLOR="#DBD7CA" # Cursor

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
