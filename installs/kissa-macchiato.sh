#!/usr/bin/env bash

export PROFILE_NAME="Kissa Macchiato"

export COLOR_01="#1F1C16"           # Black (Host)
export COLOR_02="#E87777"           # Red (Syntax string)
export COLOR_03="#8CB870"           # Green (Command)
export COLOR_04="#EAC67A"           # Yellow (Command second)
export COLOR_05="#7FA8D4"           # Blue (Path)
export COLOR_06="#B094CC"           # Magenta (Syntax var)
export COLOR_07="#6AB8B0"           # Cyan (Prompt)
export COLOR_08="#FAF0E6"           # White

export COLOR_09="#B8A48C"           # Bright Black
export COLOR_10="#E87777"           # Bright Red (Command error)
export COLOR_11="#8CB870"           # Bright Green (Exec)
export COLOR_12="#EAC67A"           # Bright Yellow
export COLOR_13="#7FA8D4"           # Bright Blue (Folder)
export COLOR_14="#B094CC"           # Bright Magenta
export COLOR_15="#6AB8B0"           # Bright Cyan
export COLOR_16="#FEF4E4"           # Bright White

export BACKGROUND_COLOR="#1F1C16"   # Background
export FOREGROUND_COLOR="#FAF0E6"   # Foreground (Text)

export CURSOR_COLOR="#FAF0E6" # Cursor

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
