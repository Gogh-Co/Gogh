#!/usr/bin/env bash

export PROFILE_NAME="Mellifluous"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#D29393"           # Red (Syntax string)
export COLOR_03="#B3B393"           # Green (Command)
export COLOR_04="#CBAA89"           # Yellow (Command second)
export COLOR_05="#A8A1BE"           # Blue (Path)
export COLOR_06="#B39FB0"           # Magenta (Syntax var)
export COLOR_07="#C0AF8C"           # Cyan (Prompt)
export COLOR_08="#DADADA"           # White

export COLOR_09="#5B5B5B"           # Bright Black
export COLOR_10="#C95954"           # Bright Red (Command error)
export COLOR_11="#828040"           # Bright Green (Exec)
export COLOR_12="#A6794C"           # Bright Yellow
export COLOR_13="#5A6599"           # Bright Blue (Folder)
export COLOR_14="#9C6995"           # Bright Magenta
export COLOR_15="#74A39E"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#DADADA"   # Foreground (Text)

export CURSOR_COLOR="#BFAD9E" # Cursor

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
