#!/usr/bin/env bash

export PROFILE_NAME="Mono Cyan"

export COLOR_01="#003340"           # Black (Host)
export COLOR_02="#00CCFF"           # Red (Syntax string)
export COLOR_03="#00CCFF"           # Green (Command)
export COLOR_04="#00CCFF"           # Yellow (Command second)
export COLOR_05="#00CCFF"           # Blue (Path)
export COLOR_06="#00CCFF"           # Magenta (Syntax var)
export COLOR_07="#00CCFF"           # Cyan (Prompt)
export COLOR_08="#00CCFF"           # White

export COLOR_09="#00CCFF"           # Bright Black
export COLOR_10="#00CCFF"           # Bright Red (Command error)
export COLOR_11="#00CCFF"           # Bright Green (Exec)
export COLOR_12="#00CCFF"           # Bright Yellow
export COLOR_13="#00CCFF"           # Bright Blue (Folder)
export COLOR_14="#00CCFF"           # Bright Magenta
export COLOR_15="#00CCFF"           # Bright Cyan
export COLOR_16="#00CCFF"           # Bright White

export BACKGROUND_COLOR="#00222B"   # Background
export FOREGROUND_COLOR="#00CCFF"   # Foreground (Text)

export CURSOR_COLOR="#00CCFF" # Cursor

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
