#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic R"

export COLOR_01="#1E1D20"           # Black (Host)
export COLOR_02="#D53975"           # Red (Syntax string)
export COLOR_03="#6577EC"           # Green (Command)
export COLOR_04="#A0ACF8"           # Yellow (Command second)
export COLOR_05="#AF88F2"           # Blue (Path)
export COLOR_06="#D763E9"           # Magenta (Syntax var)
export COLOR_07="#8493F6"           # Cyan (Prompt)
export COLOR_08="#EAE8ED"           # White

export COLOR_09="#09070D"           # Bright Black
export COLOR_10="#EB75A2"           # Bright Red (Command error)
export COLOR_11="#AEB8F9"           # Bright Green (Exec)
export COLOR_12="#C6CDFB"           # Bright Yellow
export COLOR_13="#DDCBFB"           # Bright Blue (Folder)
export COLOR_14="#E17EF1"           # Bright Magenta
export COLOR_15="#D6C2FA"           # Bright Cyan
export COLOR_16="#F7F6F9"           # Bright White

export BACKGROUND_COLOR="#1E1D20"   # Background
export FOREGROUND_COLOR="#98949E"   # Foreground (Text)

export CURSOR_COLOR="#6F7285" # Cursor

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
