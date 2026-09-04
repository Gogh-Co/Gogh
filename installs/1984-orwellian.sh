#!/usr/bin/env bash

export PROFILE_NAME="1984 Orwellian"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E74946"           # Red (Syntax string)
export COLOR_03="#4CB605"           # Green (Command)
export COLOR_04="#FCD395"           # Yellow (Command second)
export COLOR_05="#356FE4"           # Blue (Path)
export COLOR_06="#FCBE95"           # Magenta (Syntax var)
export COLOR_07="#3FC4CE"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#E74946"           # Bright Red (Command error)
export COLOR_11="#4CB605"           # Bright Green (Exec)
export COLOR_12="#FCD395"           # Bright Yellow
export COLOR_13="#356FE4"           # Bright Blue (Folder)
export COLOR_14="#FCBE95"           # Bright Magenta
export COLOR_15="#3FC4CE"           # Bright Cyan
export COLOR_16="#F1F1F1"           # Bright White

export BACKGROUND_COLOR="#2E2923"   # Background
export FOREGROUND_COLOR="#F1F1F1"   # Foreground (Text)

export CURSOR_COLOR="#F1F1F1" # Cursor

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
