#!/usr/bin/env bash

export PROFILE_NAME="Tempus Rift"

export COLOR_01="#162C22"           # Black (Host)
export COLOR_02="#C19904"           # Red (Syntax string)
export COLOR_03="#34B534"           # Green (Command)
export COLOR_04="#7FAD00"           # Yellow (Command second)
export COLOR_05="#30AEB0"           # Blue (Path)
export COLOR_06="#C8954C"           # Magenta (Syntax var)
export COLOR_07="#5FAD8F"           # Cyan (Prompt)
export COLOR_08="#AB9AA9"           # White

export COLOR_09="#283431"           # Bright Black
export COLOR_10="#D2A634"           # Bright Red (Command error)
export COLOR_11="#6AC134"           # Bright Green (Exec)
export COLOR_12="#82BD00"           # Bright Yellow
export COLOR_13="#56BDAD"           # Bright Blue (Folder)
export COLOR_14="#CCA0BA"           # Bright Magenta
export COLOR_15="#10C480"           # Bright Cyan
export COLOR_16="#BBBCBC"           # Bright White

export BACKGROUND_COLOR="#162C22"   # Background
export FOREGROUND_COLOR="#BBBCBC"   # Foreground (Text)

export CURSOR_COLOR="#BBBCBC" # Cursor

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
