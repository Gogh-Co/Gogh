#!/usr/bin/env bash

export PROFILE_NAME="Blueish"

export COLOR_01="#182430"           # Black (Host)
export COLOR_02="#4CE587"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#F6CD5C"           # Yellow (Command second)
export COLOR_05="#82AAFF"           # Blue (Path)
export COLOR_06="#FF84DD"           # Magenta (Syntax var)
export COLOR_07="#5FD1FF"           # Cyan (Prompt)
export COLOR_08="#C8E1F8"           # White

export COLOR_09="#616D78"           # Bright Black
export COLOR_10="#4CE587"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#F6CD5C"           # Bright Yellow
export COLOR_13="#82AAFF"           # Bright Blue (Folder)
export COLOR_14="#FF84DD"           # Bright Magenta
export COLOR_15="#5FD1FF"           # Bright Cyan
export COLOR_16="#8F98A0"           # Bright White

export BACKGROUND_COLOR="#182430"   # Background
export FOREGROUND_COLOR="#C8E1F8"   # Foreground (Text)

export CURSOR_COLOR="#C8E1F8" # Cursor

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
