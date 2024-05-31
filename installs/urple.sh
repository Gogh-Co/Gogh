#!/usr/bin/env bash

export PROFILE_NAME="Urple"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B0425B"           # Red (Syntax string)
export COLOR_03="#37A415"           # Green (Command)
export COLOR_04="#AD5C42"           # Yellow (Command second)
export COLOR_05="#564D9B"           # Blue (Path)
export COLOR_06="#6C3CA1"           # Magenta (Syntax var)
export COLOR_07="#808080"           # Cyan (Prompt)
export COLOR_08="#87799C"           # White

export COLOR_09="#5D3225"           # Bright Black
export COLOR_10="#FF6388"           # Bright Red (Command error)
export COLOR_11="#29E620"           # Bright Green (Exec)
export COLOR_12="#F08161"           # Bright Yellow
export COLOR_13="#867AED"           # Bright Blue (Folder)
export COLOR_14="#A05EEE"           # Bright Magenta
export COLOR_15="#EAEAEA"           # Bright Cyan
export COLOR_16="#BFA3FF"           # Bright White

export BACKGROUND_COLOR="#1B1B23"   # Background
export FOREGROUND_COLOR="#877A9B"   # Foreground (Text)

export CURSOR_COLOR="#877A9B" # Cursor

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
