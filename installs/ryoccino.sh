#!/usr/bin/env bash

export PROFILE_NAME="Ryoccino"

export COLOR_01="#313244"           # Black (Host)
export COLOR_02="#F5A3C9"           # Red (Syntax string)
export COLOR_03="#9EE6B8"           # Green (Command)
export COLOR_04="#F5E6A8"           # Yellow (Command second)
export COLOR_05="#89B4FA"           # Blue (Path)
export COLOR_06="#EEC2F2"           # Magenta (Syntax var)
export COLOR_07="#94E2D5"           # Cyan (Prompt)
export COLOR_08="#BCD2F5"           # White

export COLOR_09="#45475A"           # Bright Black
export COLOR_10="#F5A3C9"           # Bright Red (Command error)
export COLOR_11="#9EE6B8"           # Bright Green (Exec)
export COLOR_12="#F5E6A8"           # Bright Yellow
export COLOR_13="#89B4FA"           # Bright Blue (Folder)
export COLOR_14="#EEC2F2"           # Bright Magenta
export COLOR_15="#94E2D5"           # Bright Cyan
export COLOR_16="#BCD2F5"           # Bright White

export BACKGROUND_COLOR="#11131B"   # Background
export FOREGROUND_COLOR="#B4C2ED"   # Foreground (Text)

export CURSOR_COLOR="#B4C2ED" # Cursor

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
