#!/usr/bin/env bash

export PROFILE_NAME="Summercamp"

export COLOR_01="#1C1810"           # Black (Host)
export COLOR_02="#E35142"           # Red (Syntax string)
export COLOR_03="#5CEB5A"           # Green (Command)
export COLOR_04="#F2FF27"           # Yellow (Command second)
export COLOR_05="#489BF0"           # Blue (Path)
export COLOR_06="#FF8080"           # Magenta (Syntax var)
export COLOR_07="#5AEBBC"           # Cyan (Prompt)
export COLOR_08="#736E55"           # White

export COLOR_09="#504B38"           # Bright Black
export COLOR_10="#E35142"           # Bright Red (Command error)
export COLOR_11="#5CEB5A"           # Bright Green (Exec)
export COLOR_12="#F2FF27"           # Bright Yellow
export COLOR_13="#489BF0"           # Bright Blue (Folder)
export COLOR_14="#FF8080"           # Bright Magenta
export COLOR_15="#5AEBBC"           # Bright Cyan
export COLOR_16="#F8F5DE"           # Bright White

export BACKGROUND_COLOR="#1C1810"   # Background
export FOREGROUND_COLOR="#736E55"   # Foreground (Text)

export CURSOR_COLOR="#736E55" # Cursor

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
