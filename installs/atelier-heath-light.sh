#!/usr/bin/env bash

export PROFILE_NAME="Atelier Heath Light"

export COLOR_01="#F7F3F7"           # Black (Host)
export COLOR_02="#CA402B"           # Red (Syntax string)
export COLOR_03="#918B3B"           # Green (Command)
export COLOR_04="#BB8A35"           # Yellow (Command second)
export COLOR_05="#516AEC"           # Blue (Path)
export COLOR_06="#7B59C0"           # Magenta (Syntax var)
export COLOR_07="#159393"           # Cyan (Prompt)
export COLOR_08="#695D69"           # White

export COLOR_09="#9E8F9E"           # Bright Black
export COLOR_10="#CA402B"           # Bright Red (Command error)
export COLOR_11="#918B3B"           # Bright Green (Exec)
export COLOR_12="#BB8A35"           # Bright Yellow
export COLOR_13="#516AEC"           # Bright Blue (Folder)
export COLOR_14="#7B59C0"           # Bright Magenta
export COLOR_15="#159393"           # Bright Cyan
export COLOR_16="#1B181B"           # Bright White

export BACKGROUND_COLOR="#F7F3F7"   # Background
export FOREGROUND_COLOR="#695D69"   # Foreground (Text)

export CURSOR_COLOR="#695D69" # Cursor

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
