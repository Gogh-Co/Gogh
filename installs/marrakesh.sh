#!/usr/bin/env bash

export PROFILE_NAME="Marrakesh"

export COLOR_01="#201602"           # Black (Host)
export COLOR_02="#C35359"           # Red (Syntax string)
export COLOR_03="#18974E"           # Green (Command)
export COLOR_04="#A88339"           # Yellow (Command second)
export COLOR_05="#477CA1"           # Blue (Path)
export COLOR_06="#8868B3"           # Magenta (Syntax var)
export COLOR_07="#75A738"           # Cyan (Prompt)
export COLOR_08="#948E48"           # White

export COLOR_09="#6C6823"           # Bright Black
export COLOR_10="#C35359"           # Bright Red (Command error)
export COLOR_11="#18974E"           # Bright Green (Exec)
export COLOR_12="#A88339"           # Bright Yellow
export COLOR_13="#477CA1"           # Bright Blue (Folder)
export COLOR_14="#8868B3"           # Bright Magenta
export COLOR_15="#75A738"           # Bright Cyan
export COLOR_16="#FAF0A5"           # Bright White

export BACKGROUND_COLOR="#201602"   # Background
export FOREGROUND_COLOR="#948E48"   # Foreground (Text)

export CURSOR_COLOR="#948E48" # Cursor

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
