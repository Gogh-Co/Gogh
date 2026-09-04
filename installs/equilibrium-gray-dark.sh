#!/usr/bin/env bash

export PROFILE_NAME="Equilibrium Gray Dark"

export COLOR_01="#111111"           # Black (Host)
export COLOR_02="#F04339"           # Red (Syntax string)
export COLOR_03="#7F8B00"           # Green (Command)
export COLOR_04="#BB8801"           # Yellow (Command second)
export COLOR_05="#008DD1"           # Blue (Path)
export COLOR_06="#6A7FD2"           # Magenta (Syntax var)
export COLOR_07="#00948B"           # Cyan (Prompt)
export COLOR_08="#ABABAB"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#F04339"           # Bright Red (Command error)
export COLOR_11="#7F8B00"           # Bright Green (Exec)
export COLOR_12="#BB8801"           # Bright Yellow
export COLOR_13="#008DD1"           # Bright Blue (Folder)
export COLOR_14="#6A7FD2"           # Bright Magenta
export COLOR_15="#00948B"           # Bright Cyan
export COLOR_16="#E2E2E2"           # Bright White

export BACKGROUND_COLOR="#111111"   # Background
export FOREGROUND_COLOR="#ABABAB"   # Foreground (Text)

export CURSOR_COLOR="#ABABAB" # Cursor

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
