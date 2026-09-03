#!/usr/bin/env bash

export PROFILE_NAME="Cursor Dark"

export COLOR_01="#242424"           # Black (Host)
export COLOR_02="#FC6B83"           # Red (Syntax string)
export COLOR_03="#3FA266"           # Green (Command)
export COLOR_04="#D2943E"           # Yellow (Command second)
export COLOR_05="#81A1C1"           # Blue (Path)
export COLOR_06="#B48EAD"           # Magenta (Syntax var)
export COLOR_07="#88C0D0"           # Cyan (Prompt)
export COLOR_08="#E4E4E4"           # White

export COLOR_09="#4A4A4A"           # Bright Black
export COLOR_10="#FC6B83"           # Bright Red (Command error)
export COLOR_11="#70B489"           # Bright Green (Exec)
export COLOR_12="#F1B467"           # Bright Yellow
export COLOR_13="#87A6C4"           # Bright Blue (Folder)
export COLOR_14="#B48EAD"           # Bright Magenta
export COLOR_15="#88C0D0"           # Bright Cyan
export COLOR_16="#E4E4E4"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#D4D4D4"   # Foreground (Text)

export CURSOR_COLOR="#D4D4D4" # Cursor

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
