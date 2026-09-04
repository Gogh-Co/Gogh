#!/usr/bin/env bash

export PROFILE_NAME="Snow Dark"

export COLOR_01="#2C2D30"           # Black (Host)
export COLOR_02="#BE868C"           # Red (Syntax string)
export COLOR_03="#7F9D77"           # Green (Command)
export COLOR_04="#AB916D"           # Yellow (Command second)
export COLOR_05="#759ABD"           # Blue (Path)
export COLOR_06="#A88CB3"           # Magenta (Syntax var)
export COLOR_07="#5DA19F"           # Cyan (Prompt)
export COLOR_08="#AFB7C0"           # White

export COLOR_09="#363A3E"           # Bright Black
export COLOR_10="#BE868C"           # Bright Red (Command error)
export COLOR_11="#7F9D77"           # Bright Green (Exec)
export COLOR_12="#AB916D"           # Bright Yellow
export COLOR_13="#759ABD"           # Bright Blue (Folder)
export COLOR_14="#A88CB3"           # Bright Magenta
export COLOR_15="#5DA19F"           # Bright Cyan
export COLOR_16="#CBD2D9"           # Bright White

export BACKGROUND_COLOR="#2C2D30"   # Background
export FOREGROUND_COLOR="#AFB7C0"   # Foreground (Text)

export CURSOR_COLOR="#AFB7C0" # Cursor

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
