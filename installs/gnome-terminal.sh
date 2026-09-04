#!/usr/bin/env bash

export PROFILE_NAME="Gnome Terminal"

export COLOR_01="#171421"           # Black (Host)
export COLOR_02="#C01C28"           # Red (Syntax string)
export COLOR_03="#26A269"           # Green (Command)
export COLOR_04="#A2734C"           # Yellow (Command second)
export COLOR_05="#12488B"           # Blue (Path)
export COLOR_06="#A347BA"           # Magenta (Syntax var)
export COLOR_07="#2AA1B3"           # Cyan (Prompt)
export COLOR_08="#D0CFCC"           # White

export COLOR_09="#5E5C64"           # Bright Black
export COLOR_10="#F66151"           # Bright Red (Command error)
export COLOR_11="#33D17A"           # Bright Green (Exec)
export COLOR_12="#E9AD0C"           # Bright Yellow
export COLOR_13="#2A7BDE"           # Bright Blue (Folder)
export COLOR_14="#C061CB"           # Bright Magenta
export COLOR_15="#33C7DE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
