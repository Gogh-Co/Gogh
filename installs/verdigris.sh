#!/usr/bin/env bash

export PROFILE_NAME="Verdigris"

export COLOR_01="#221C12"           # Black (Host)
export COLOR_02="#D9604F"           # Red (Syntax string)
export COLOR_03="#A8B86A"           # Green (Command)
export COLOR_04="#D9A441"           # Yellow (Command second)
export COLOR_05="#5FBFB0"           # Blue (Path)
export COLOR_06="#B98FB0"           # Magenta (Syntax var)
export COLOR_07="#8FD6B0"           # Cyan (Prompt)
export COLOR_08="#BFB29A"           # White

export COLOR_09="#6E6450"           # Bright Black
export COLOR_10="#D9604F"           # Bright Red (Command error)
export COLOR_11="#A8B86A"           # Bright Green (Exec)
export COLOR_12="#C97A45"           # Bright Yellow
export COLOR_13="#5FBFB0"           # Bright Blue (Folder)
export COLOR_14="#B98FB0"           # Bright Magenta
export COLOR_15="#8FD6B0"           # Bright Cyan
export COLOR_16="#E8DCC6"           # Bright White

export BACKGROUND_COLOR="#14110B"   # Background
export FOREGROUND_COLOR="#E8DCC6"   # Foreground (Text)

export CURSOR_COLOR="#CE8B45" # Cursor

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
