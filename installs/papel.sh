#!/usr/bin/env bash

export PROFILE_NAME="Papel"

export COLOR_01="#F5EFE2"           # Black (Host)
export COLOR_02="#C0392B"           # Red (Syntax string)
export COLOR_03="#5E7A28"           # Green (Command)
export COLOR_04="#A8761A"           # Yellow (Command second)
export COLOR_05="#2C6CA0"           # Blue (Path)
export COLOR_06="#9B4D8E"           # Magenta (Syntax var)
export COLOR_07="#2A8A7A"           # Cyan (Prompt)
export COLOR_08="#3A2E20"           # White

export COLOR_09="#9A8C76"           # Bright Black
export COLOR_10="#C0392B"           # Bright Red (Command error)
export COLOR_11="#5E7A28"           # Bright Green (Exec)
export COLOR_12="#A8761A"           # Bright Yellow
export COLOR_13="#2C6CA0"           # Bright Blue (Folder)
export COLOR_14="#9B4D8E"           # Bright Magenta
export COLOR_15="#2A8A7A"           # Bright Cyan
export COLOR_16="#EFE8D8"           # Bright White

export BACKGROUND_COLOR="#F5EFE2"   # Background
export FOREGROUND_COLOR="#3A2E20"   # Foreground (Text)

export CURSOR_COLOR="#3A2E20" # Cursor

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
