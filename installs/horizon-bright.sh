#!/usr/bin/env bash

export PROFILE_NAME="Horizon Bright"

export COLOR_01="#16161C"           # Black (Host)
export COLOR_02="#E95678"           # Red (Syntax string)
export COLOR_03="#29D398"           # Green (Command)
export COLOR_04="#FAB795"           # Yellow (Command second)
export COLOR_05="#26BBD9"           # Blue (Path)
export COLOR_06="#EE64AE"           # Magenta (Syntax var)
export COLOR_07="#59E3E3"           # Cyan (Prompt)
export COLOR_08="#FDF0ED"           # White

export COLOR_09="#1A1C23"           # Bright Black
export COLOR_10="#EC6A88"           # Bright Red (Command error)
export COLOR_11="#3FDAA4"           # Bright Green (Exec)
export COLOR_12="#FBC3A7"           # Bright Yellow
export COLOR_13="#3FC6DE"           # Bright Blue (Folder)
export COLOR_14="#F075B7"           # Bright Magenta
export COLOR_15="#6BE6E6"           # Bright Cyan
export COLOR_16="#FFF3F0"           # Bright White

export BACKGROUND_COLOR="#FBF0EE"   # Background
export FOREGROUND_COLOR="#16161C"   # Foreground (Text)

export CURSOR_COLOR="#F2D0C5" # Cursor

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
