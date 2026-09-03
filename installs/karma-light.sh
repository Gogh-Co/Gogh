#!/usr/bin/env bash

export PROFILE_NAME="Karma Light"

export COLOR_01="#0A0E14"           # Black (Host)
export COLOR_02="#FC618D"           # Red (Syntax string)
export COLOR_03="#2D972F"           # Green (Command)
export COLOR_04="#EEAE11"           # Yellow (Command second)
export COLOR_05="#5688C7"           # Blue (Path)
export COLOR_06="#6F42C1"           # Magenta (Syntax var)
export COLOR_07="#5688C7"           # Cyan (Prompt)
export COLOR_08="#525053"           # White

export COLOR_09="#999999"           # Bright Black
export COLOR_10="#FC618D"           # Bright Red (Command error)
export COLOR_11="#2D972F"           # Bright Green (Exec)
export COLOR_12="#FFAA33"           # Bright Yellow
export COLOR_13="#5688C7"           # Bright Blue (Folder)
export COLOR_14="#A86EFD"           # Bright Magenta
export COLOR_15="#5688C7"           # Bright Cyan
export COLOR_16="#0A0E14"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#0A0E14"   # Foreground (Text)

export CURSOR_COLOR="#A86EFD" # Cursor

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
