#!/usr/bin/env bash

export PROFILE_NAME="Elemental"

export COLOR_01="#3C3C30"           # Black (Host)
export COLOR_02="#98290F"           # Red (Syntax string)
export COLOR_03="#479A43"           # Green (Command)
export COLOR_04="#7F7111"           # Yellow (Command second)
export COLOR_05="#497F7D"           # Blue (Path)
export COLOR_06="#7F4E2F"           # Magenta (Syntax var)
export COLOR_07="#387F58"           # Cyan (Prompt)
export COLOR_08="#807974"           # White

export COLOR_09="#555445"           # Bright Black
export COLOR_10="#E0502A"           # Bright Red (Command error)
export COLOR_11="#61E070"           # Bright Green (Exec)
export COLOR_12="#D69927"           # Bright Yellow
export COLOR_13="#79D9D9"           # Bright Blue (Folder)
export COLOR_14="#CD7C54"           # Bright Magenta
export COLOR_15="#59D599"           # Bright Cyan
export COLOR_16="#FFF1E9"           # Bright White

export BACKGROUND_COLOR="#22211D"   # Background
export FOREGROUND_COLOR="#807A74"   # Foreground (Text)

export CURSOR_COLOR="#807A74" # Cursor

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
