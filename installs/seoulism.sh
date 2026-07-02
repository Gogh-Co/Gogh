#!/usr/bin/env bash

export PROFILE_NAME="Seoulism"

export COLOR_01="#101114"           # Black (Host)
export COLOR_02="#E94536"           # Red (Syntax string)
export COLOR_03="#22D2B5"           # Green (Command)
export COLOR_04="#FF9F3E"           # Yellow (Command second)
export COLOR_05="#2D5CE6"           # Blue (Path)
export COLOR_06="#9C5CEB"           # Magenta (Syntax var)
export COLOR_07="#2C9DD6"           # Cyan (Prompt)
export COLOR_08="#E0E0DC"           # White

export COLOR_09="#242630"           # Bright Black
export COLOR_10="#EE6962"           # Bright Red (Command error)
export COLOR_11="#53DCBA"           # Bright Green (Exec)
export COLOR_12="#FFC068"           # Bright Yellow
export COLOR_13="#5B80EC"           # Bright Blue (Folder)
export COLOR_14="#C680EF"           # Bright Magenta
export COLOR_15="#5AB3DF"           # Bright Cyan
export COLOR_16="#E7E7E4"           # Bright White

export BACKGROUND_COLOR="#101114"   # Background
export FOREGROUND_COLOR="#ECECE9"   # Foreground (Text)

export CURSOR_COLOR="#ECECE9" # Cursor

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
