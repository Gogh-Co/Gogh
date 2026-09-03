#!/usr/bin/env bash

export PROFILE_NAME="GitHub Light Colorblind"

export COLOR_01="#24292F"           # Black (Host)
export COLOR_02="#B35900"           # Red (Syntax string)
export COLOR_03="#0550AE"           # Green (Command)
export COLOR_04="#4D2D00"           # Yellow (Command second)
export COLOR_05="#0969DA"           # Blue (Path)
export COLOR_06="#8250DF"           # Magenta (Syntax var)
export COLOR_07="#1B7C83"           # Cyan (Prompt)
export COLOR_08="#6E7781"           # White

export COLOR_09="#57606A"           # Bright Black
export COLOR_10="#8A4600"           # Bright Red (Command error)
export COLOR_11="#0969DA"           # Bright Green (Exec)
export COLOR_12="#633C01"           # Bright Yellow
export COLOR_13="#218BFF"           # Bright Blue (Folder)
export COLOR_14="#A475F9"           # Bright Magenta
export COLOR_15="#3192AA"           # Bright Cyan
export COLOR_16="#8C959F"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#24292F"   # Foreground (Text)

export CURSOR_COLOR="#0969DA" # Cursor

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
