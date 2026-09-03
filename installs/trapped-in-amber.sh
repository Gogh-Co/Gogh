#!/usr/bin/env bash

export PROFILE_NAME="Trapped in Amber"

export COLOR_01="#4A3220"           # Black (Host)
export COLOR_02="#E05C1C"           # Red (Syntax string)
export COLOR_03="#7A9C4A"           # Green (Command)
export COLOR_04="#F0A020"           # Yellow (Command second)
export COLOR_05="#4A7EC9"           # Blue (Path)
export COLOR_06="#C95A8C"           # Magenta (Syntax var)
export COLOR_07="#7A9EA8"           # Cyan (Prompt)
export COLOR_08="#FFD9A0"           # White

export COLOR_09="#5A4A3A"           # Bright Black
export COLOR_10="#FF7832"           # Bright Red (Command error)
export COLOR_11="#A8C46B"           # Bright Green (Exec)
export COLOR_12="#FFD700"           # Bright Yellow
export COLOR_13="#6B9FFF"           # Bright Blue (Folder)
export COLOR_14="#FF7FA8"           # Bright Magenta
export COLOR_15="#A5C2CC"           # Bright Cyan
export COLOR_16="#FFF5E0"           # Bright White

export BACKGROUND_COLOR="#0A1017"   # Background
export FOREGROUND_COLOR="#F0A020"   # Foreground (Text)

export CURSOR_COLOR="#FFC940" # Cursor

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
