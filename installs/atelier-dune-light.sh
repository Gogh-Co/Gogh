#!/usr/bin/env bash

export PROFILE_NAME="Atelier Dune Light"

export COLOR_01="#FEFBEC"           # Black (Host)
export COLOR_02="#D73737"           # Red (Syntax string)
export COLOR_03="#60AC39"           # Green (Command)
export COLOR_04="#AE9513"           # Yellow (Command second)
export COLOR_05="#6684E1"           # Blue (Path)
export COLOR_06="#B854D4"           # Magenta (Syntax var)
export COLOR_07="#1FAD83"           # Cyan (Prompt)
export COLOR_08="#6E6B5E"           # White

export COLOR_09="#999580"           # Bright Black
export COLOR_10="#D73737"           # Bright Red (Command error)
export COLOR_11="#60AC39"           # Bright Green (Exec)
export COLOR_12="#AE9513"           # Bright Yellow
export COLOR_13="#6684E1"           # Bright Blue (Folder)
export COLOR_14="#B854D4"           # Bright Magenta
export COLOR_15="#1FAD83"           # Bright Cyan
export COLOR_16="#20201D"           # Bright White

export BACKGROUND_COLOR="#FEFBEC"   # Background
export FOREGROUND_COLOR="#6E6B5E"   # Foreground (Text)

export CURSOR_COLOR="#6E6B5E" # Cursor

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
