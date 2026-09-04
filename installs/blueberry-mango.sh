#!/usr/bin/env bash

export PROFILE_NAME="Blueberry Mango"

export COLOR_01="#16141E"           # Black (Host)
export COLOR_02="#ED7481"           # Red (Syntax string)
export COLOR_03="#54B99D"           # Green (Command)
export COLOR_04="#E0C750"           # Yellow (Command second)
export COLOR_05="#6EE4DE"           # Blue (Path)
export COLOR_06="#CA476A"           # Magenta (Syntax var)
export COLOR_07="#6FB3BF"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#4A5060"           # Bright Black
export COLOR_10="#F0A2A3"           # Bright Red (Command error)
export COLOR_11="#A0C180"           # Bright Green (Exec)
export COLOR_12="#F5E47D"           # Bright Yellow
export COLOR_13="#ABFCF3"           # Bright Blue (Folder)
export COLOR_14="#CC75D0"           # Bright Magenta
export COLOR_15="#C7F1FC"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#181321"   # Background
export FOREGROUND_COLOR="#FEFFE0"   # Foreground (Text)

export CURSOR_COLOR="#FEFFE0" # Cursor

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
