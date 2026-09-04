#!/usr/bin/env bash

export PROFILE_NAME="Embarcadero"

export COLOR_01="#252A2F"           # Black (Host)
export COLOR_02="#ED5D86"           # Red (Syntax string)
export COLOR_03="#20C290"           # Green (Command)
export COLOR_04="#EB824D"           # Yellow (Command second)
export COLOR_05="#4080D0"           # Blue (Path)
export COLOR_06="#A070D0"           # Magenta (Syntax var)
export COLOR_07="#02EFEF"           # Cyan (Prompt)
export COLOR_08="#BCBDC0"           # White

export COLOR_09="#7F8285"           # Bright Black
export COLOR_10="#F57D9A"           # Bright Red (Command error)
export COLOR_11="#A0D0A0"           # Bright Green (Exec)
export COLOR_12="#FFE089"           # Bright Yellow
export COLOR_13="#80B0F0"           # Bright Blue (Folder)
export COLOR_14="#C090F0"           # Bright Magenta
export COLOR_15="#40C0C0"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#252A2F"   # Background
export FOREGROUND_COLOR="#BCBDC0"   # Foreground (Text)

export CURSOR_COLOR="#BCBDC0" # Cursor

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
