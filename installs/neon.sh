#!/usr/bin/env bash

export PROFILE_NAME="Neon"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF3045"           # Red (Syntax string)
export COLOR_03="#5FFA74"           # Green (Command)
export COLOR_04="#FFFC7E"           # Yellow (Command second)
export COLOR_05="#0208CB"           # Blue (Path)
export COLOR_06="#F924E7"           # Magenta (Syntax var)
export COLOR_07="#00FFFC"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#FF5A5A"           # Bright Red (Command error)
export COLOR_11="#75FF88"           # Bright Green (Exec)
export COLOR_12="#FFFD96"           # Bright Yellow
export COLOR_13="#3C40CB"           # Bright Blue (Folder)
export COLOR_14="#F15BE5"           # Bright Magenta
export COLOR_15="#88FFFE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#14161A"   # Background
export FOREGROUND_COLOR="#00FFFC"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
