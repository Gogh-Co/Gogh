#!/usr/bin/env bash

export PROFILE_NAME="Matrix"

export COLOR_01="#0F191C"           # Black (Host)
export COLOR_02="#23755A"           # Red (Syntax string)
export COLOR_03="#82D967"           # Green (Command)
export COLOR_04="#FFD700"           # Yellow (Command second)
export COLOR_05="#3F5242"           # Blue (Path)
export COLOR_06="#409931"           # Magenta (Syntax var)
export COLOR_07="#50B45A"           # Cyan (Prompt)
export COLOR_08="#507350"           # White

export COLOR_09="#688060"           # Bright Black
export COLOR_10="#2FC079"           # Bright Red (Command error)
export COLOR_11="#90D762"           # Bright Green (Exec)
export COLOR_12="#FAFF00"           # Bright Yellow
export COLOR_13="#4F7E7E"           # Bright Blue (Folder)
export COLOR_14="#11FF25"           # Bright Magenta
export COLOR_15="#C1FF8A"           # Bright Cyan
export COLOR_16="#678C61"           # Bright White

export BACKGROUND_COLOR="#0F191C"   # Background
export FOREGROUND_COLOR="#426644"   # Foreground (Text)

export CURSOR_COLOR="#384545" # Cursor

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
