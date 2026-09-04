#!/usr/bin/env bash

export PROFILE_NAME="Default Light"

export COLOR_01="#F8F8F8"           # Black (Host)
export COLOR_02="#AB4642"           # Red (Syntax string)
export COLOR_03="#A1B56C"           # Green (Command)
export COLOR_04="#F7CA88"           # Yellow (Command second)
export COLOR_05="#7CAFC2"           # Blue (Path)
export COLOR_06="#BA8BAF"           # Magenta (Syntax var)
export COLOR_07="#86C1B9"           # Cyan (Prompt)
export COLOR_08="#383838"           # White

export COLOR_09="#B8B8B8"           # Bright Black
export COLOR_10="#AB4642"           # Bright Red (Command error)
export COLOR_11="#A1B56C"           # Bright Green (Exec)
export COLOR_12="#F7CA88"           # Bright Yellow
export COLOR_13="#7CAFC2"           # Bright Blue (Folder)
export COLOR_14="#BA8BAF"           # Bright Magenta
export COLOR_15="#86C1B9"           # Bright Cyan
export COLOR_16="#181818"           # Bright White

export BACKGROUND_COLOR="#F8F8F8"   # Background
export FOREGROUND_COLOR="#383838"   # Foreground (Text)

export CURSOR_COLOR="#383838" # Cursor

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
