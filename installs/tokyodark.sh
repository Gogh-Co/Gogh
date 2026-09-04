#!/usr/bin/env bash

export PROFILE_NAME="Tokyodark"

export COLOR_01="#11121D"           # Black (Host)
export COLOR_02="#EE6D85"           # Red (Syntax string)
export COLOR_03="#95C561"           # Green (Command)
export COLOR_04="#D7A65F"           # Yellow (Command second)
export COLOR_05="#7199EE"           # Blue (Path)
export COLOR_06="#A485DD"           # Magenta (Syntax var)
export COLOR_07="#9FBBF3"           # Cyan (Prompt)
export COLOR_08="#A0A8CD"           # White

export COLOR_09="#353945"           # Bright Black
export COLOR_10="#EE6D85"           # Bright Red (Command error)
export COLOR_11="#95C561"           # Bright Green (Exec)
export COLOR_12="#D7A65F"           # Bright Yellow
export COLOR_13="#7199EE"           # Bright Blue (Folder)
export COLOR_14="#A485DD"           # Bright Magenta
export COLOR_15="#9FBBF3"           # Bright Cyan
export COLOR_16="#BCC2DC"           # Bright White

export BACKGROUND_COLOR="#11121D"   # Background
export FOREGROUND_COLOR="#A0A8CD"   # Foreground (Text)

export CURSOR_COLOR="#A0A8CD" # Cursor

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
