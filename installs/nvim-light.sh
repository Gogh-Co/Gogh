#!/usr/bin/env bash

export PROFILE_NAME="Nvim Light"

export COLOR_01="#07080D"           # Black (Host)
export COLOR_02="#590008"           # Red (Syntax string)
export COLOR_03="#005523"           # Green (Command)
export COLOR_04="#6B5300"           # Yellow (Command second)
export COLOR_05="#004C73"           # Blue (Path)
export COLOR_06="#470045"           # Magenta (Syntax var)
export COLOR_07="#007373"           # Cyan (Prompt)
export COLOR_08="#EEF1F8"           # White

export COLOR_09="#4F5258"           # Bright Black
export COLOR_10="#590008"           # Bright Red (Command error)
export COLOR_11="#005523"           # Bright Green (Exec)
export COLOR_12="#6B5300"           # Bright Yellow
export COLOR_13="#004C73"           # Bright Blue (Folder)
export COLOR_14="#470045"           # Bright Magenta
export COLOR_15="#007373"           # Bright Cyan
export COLOR_16="#EEF1F8"           # Bright White

export BACKGROUND_COLOR="#E0E2EA"   # Background
export FOREGROUND_COLOR="#14161B"   # Foreground (Text)

export CURSOR_COLOR="#9B9EA4" # Cursor

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
