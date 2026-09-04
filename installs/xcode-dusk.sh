#!/usr/bin/env bash

export PROFILE_NAME="Xcode Dusk"

export COLOR_01="#282B35"           # Black (Host)
export COLOR_02="#B21889"           # Red (Syntax string)
export COLOR_03="#DF0002"           # Green (Command)
export COLOR_04="#438288"           # Yellow (Command second)
export COLOR_05="#790EAD"           # Blue (Path)
export COLOR_06="#B21889"           # Magenta (Syntax var)
export COLOR_07="#00A0BE"           # Cyan (Prompt)
export COLOR_08="#939599"           # White

export COLOR_09="#686A71"           # Bright Black
export COLOR_10="#B21889"           # Bright Red (Command error)
export COLOR_11="#DF0002"           # Bright Green (Exec)
export COLOR_12="#438288"           # Bright Yellow
export COLOR_13="#790EAD"           # Bright Blue (Folder)
export COLOR_14="#B21889"           # Bright Magenta
export COLOR_15="#00A0BE"           # Bright Cyan
export COLOR_16="#BEBFC2"           # Bright White

export BACKGROUND_COLOR="#282B35"   # Background
export FOREGROUND_COLOR="#939599"   # Foreground (Text)

export CURSOR_COLOR="#939599" # Cursor

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
