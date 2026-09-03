#!/usr/bin/env bash

export PROFILE_NAME="Lab Fox"

export COLOR_01="#2E2E2E"           # Black (Host)
export COLOR_02="#FC6D26"           # Red (Syntax string)
export COLOR_03="#3EB383"           # Green (Command)
export COLOR_04="#FCA121"           # Yellow (Command second)
export COLOR_05="#DB3B21"           # Blue (Path)
export COLOR_06="#380D75"           # Magenta (Syntax var)
export COLOR_07="#6E49CB"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#464646"           # Bright Black
export COLOR_10="#FF6517"           # Bright Red (Command error)
export COLOR_11="#53EAA8"           # Bright Green (Exec)
export COLOR_12="#FCA013"           # Bright Yellow
export COLOR_13="#DB501F"           # Bright Blue (Folder)
export COLOR_14="#441090"           # Bright Magenta
export COLOR_15="#7D53E7"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2E2E2E"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#7F7F7F" # Cursor

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
