#!/usr/bin/env bash

export PROFILE_NAME="Solarized Osaka Light"

export COLOR_01="#CAC4B5"           # Black (Host)
export COLOR_02="#DB302D"           # Red (Syntax string)
export COLOR_03="#849900"           # Green (Command)
export COLOR_04="#B28500"           # Yellow (Command second)
export COLOR_05="#268BD3"           # Blue (Path)
export COLOR_06="#D23681"           # Magenta (Syntax var)
export COLOR_07="#29A298"           # Cyan (Prompt)
export COLOR_08="#576D74"           # White

export COLOR_09="#ADB7B7"           # Bright Black
export COLOR_10="#DB302D"           # Bright Red (Command error)
export COLOR_11="#849900"           # Bright Green (Exec)
export COLOR_12="#B28500"           # Bright Yellow
export COLOR_13="#268BD3"           # Bright Blue (Folder)
export COLOR_14="#D23681"           # Bright Magenta
export COLOR_15="#29A298"           # Bright Cyan
export COLOR_16="#576D74"           # Bright White

export BACKGROUND_COLOR="#FDF5E2"   # Background
export FOREGROUND_COLOR="#576D74"   # Foreground (Text)

export CURSOR_COLOR="#576D74" # Cursor

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
