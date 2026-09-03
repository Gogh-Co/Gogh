#!/usr/bin/env bash

export PROFILE_NAME="Dimidium"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CF494C"           # Red (Syntax string)
export COLOR_03="#60B442"           # Green (Command)
export COLOR_04="#DB9C11"           # Yellow (Command second)
export COLOR_05="#0575D8"           # Blue (Path)
export COLOR_06="#AF5ED2"           # Magenta (Syntax var)
export COLOR_07="#1DB6BB"           # Cyan (Prompt)
export COLOR_08="#BAB7B6"           # White

export COLOR_09="#817E7E"           # Bright Black
export COLOR_10="#FF643B"           # Bright Red (Command error)
export COLOR_11="#37E57B"           # Bright Green (Exec)
export COLOR_12="#FCCD1A"           # Bright Yellow
export COLOR_13="#688DFD"           # Bright Blue (Folder)
export COLOR_14="#ED6FE9"           # Bright Magenta
export COLOR_15="#32E0FB"           # Bright Cyan
export COLOR_16="#DEE3E4"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#BAB7B6"   # Foreground (Text)

export CURSOR_COLOR="#37E57B" # Cursor

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
