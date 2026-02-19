#!/usr/bin/env bash

export PROFILE_NAME="Highway"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D00E18"           # Red (Syntax string)
export COLOR_03="#138034"           # Green (Command)
export COLOR_04="#FFCB3E"           # Yellow (Command second)
export COLOR_05="#006BB3"           # Blue (Path)
export COLOR_06="#6B2775"           # Magenta (Syntax var)
export COLOR_07="#384564"           # Cyan (Prompt)
export COLOR_08="#EDEDED"           # White

export COLOR_09="#5D504A"           # Bright Black
export COLOR_10="#F07E18"           # Bright Red (Command error)
export COLOR_11="#B1D130"           # Bright Green (Exec)
export COLOR_12="#FFF120"           # Bright Yellow
export COLOR_13="#4FC2FD"           # Bright Blue (Folder)
export COLOR_14="#DE0071"           # Bright Magenta
export COLOR_15="#5D504A"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222225"   # Background
export FOREGROUND_COLOR="#EDEDED"   # Foreground (Text)

export CURSOR_COLOR="#EDEDED" # Cursor

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
