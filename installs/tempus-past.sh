#!/usr/bin/env bash

export PROFILE_NAME="Tempus Past"

export COLOR_01="#53545B"           # Black (Host)
export COLOR_02="#C00C50"           # Red (Syntax string)
export COLOR_03="#0A7040"           # Green (Command)
export COLOR_04="#A6403A"           # Yellow (Command second)
export COLOR_05="#1763AA"           # Blue (Path)
export COLOR_06="#B02874"           # Magenta (Syntax var)
export COLOR_07="#096A83"           # Cyan (Prompt)
export COLOR_08="#EAE2DE"           # White

export COLOR_09="#80565D"           # Bright Black
export COLOR_10="#BD3133"           # Bright Red (Command error)
export COLOR_11="#337243"           # Bright Green (Exec)
export COLOR_12="#8D554A"           # Bright Yellow
export COLOR_13="#5559BB"           # Bright Blue (Folder)
export COLOR_14="#B022A7"           # Bright Magenta
export COLOR_15="#07707A"           # Bright Cyan
export COLOR_16="#F3F2F4"           # Bright White

export BACKGROUND_COLOR="#F3F2F4"   # Background
export FOREGROUND_COLOR="#53545B"   # Foreground (Text)

export CURSOR_COLOR="#53545B" # Cursor

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
