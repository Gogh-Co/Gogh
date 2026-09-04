#!/usr/bin/env bash

export PROFILE_NAME="Ia Light"

export COLOR_01="#F6F6F6"           # Black (Host)
export COLOR_02="#9C5A02"           # Red (Syntax string)
export COLOR_03="#38781C"           # Green (Command)
export COLOR_04="#C48218"           # Yellow (Command second)
export COLOR_05="#48BAC2"           # Blue (Path)
export COLOR_06="#A94598"           # Magenta (Syntax var)
export COLOR_07="#2D6BB1"           # Cyan (Prompt)
export COLOR_08="#181818"           # White

export COLOR_09="#898989"           # Bright Black
export COLOR_10="#9C5A02"           # Bright Red (Command error)
export COLOR_11="#38781C"           # Bright Green (Exec)
export COLOR_12="#C48218"           # Bright Yellow
export COLOR_13="#48BAC2"           # Bright Blue (Folder)
export COLOR_14="#A94598"           # Bright Magenta
export COLOR_15="#2D6BB1"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#F6F6F6"   # Background
export FOREGROUND_COLOR="#181818"   # Foreground (Text)

export CURSOR_COLOR="#181818" # Cursor

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
