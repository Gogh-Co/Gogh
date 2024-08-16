#!/usr/bin/env bash

export PROFILE_NAME="Atelier Heath"

export COLOR_01="#CA402B"           # Black (Host)
export COLOR_02="#CA402B"           # Red (Syntax string)
export COLOR_03="#918B3B"           # Green (Command)
export COLOR_04="#BB8A35"           # Yellow (Command second)
export COLOR_05="#516AEC"           # Blue (Path)
export COLOR_06="#CC33CC"           # Magenta (Syntax var)
export COLOR_07="#159393"           # Cyan (Prompt)
export COLOR_08="#D8CAD8"           # White

export COLOR_09="#776977"           # Bright Black
export COLOR_10="#A65926"           # Bright Red (Command error)
export COLOR_11="#918B3B"           # Bright Green (Exec)
export COLOR_12="#BB8A35"           # Bright Yellow
export COLOR_13="#7B59C0"           # Bright Blue (Folder)
export COLOR_14="#CC33CC"           # Bright Magenta
export COLOR_15="#159393"           # Bright Cyan
export COLOR_16="#F7F3F7"           # Bright White

export BACKGROUND_COLOR="#1B181B"   # Background
export FOREGROUND_COLOR="#9E8F9E"   # Foreground (Text)

export CURSOR_COLOR="#9E8F9E" # Cursor

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
