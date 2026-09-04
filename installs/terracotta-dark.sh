#!/usr/bin/env bash

export PROFILE_NAME="Terracotta Dark"

export COLOR_01="#241D1A"           # Black (Host)
export COLOR_02="#F6998F"           # Red (Syntax string)
export COLOR_03="#B6C68A"           # Green (Command)
export COLOR_04="#FFC37A"           # Yellow (Command second)
export COLOR_05="#B0A4C3"           # Blue (Path)
export COLOR_06="#D8A2B0"           # Magenta (Syntax var)
export COLOR_07="#C0BCDB"           # Cyan (Prompt)
export COLOR_08="#B8A59D"           # White

export COLOR_09="#594740"           # Bright Black
export COLOR_10="#F6998F"           # Bright Red (Command error)
export COLOR_11="#B6C68A"           # Bright Green (Exec)
export COLOR_12="#FFC37A"           # Bright Yellow
export COLOR_13="#B0A4C3"           # Bright Blue (Folder)
export COLOR_14="#D8A2B0"           # Bright Magenta
export COLOR_15="#C0BCDB"           # Bright Cyan
export COLOR_16="#DCD2CE"           # Bright White

export BACKGROUND_COLOR="#241D1A"   # Background
export FOREGROUND_COLOR="#B8A59D"   # Foreground (Text)

export CURSOR_COLOR="#B8A59D" # Cursor

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
