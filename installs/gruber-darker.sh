#!/usr/bin/env bash

export PROFILE_NAME="Gruber Darker"

export COLOR_01="#181818"           # Black (Host)
export COLOR_02="#F43841"           # Red (Syntax string)
export COLOR_03="#73D936"           # Green (Command)
export COLOR_04="#FFDD33"           # Yellow (Command second)
export COLOR_05="#96A6C8"           # Blue (Path)
export COLOR_06="#9E95C7"           # Magenta (Syntax var)
export COLOR_07="#95A99F"           # Cyan (Prompt)
export COLOR_08="#E4E4E4"           # White

export COLOR_09="#52494E"           # Bright Black
export COLOR_10="#FF4F58"           # Bright Red (Command error)
export COLOR_11="#73D936"           # Bright Green (Exec)
export COLOR_12="#FFDD33"           # Bright Yellow
export COLOR_13="#96A6C8"           # Bright Blue (Folder)
export COLOR_14="#AFAFD7"           # Bright Magenta
export COLOR_15="#95A99F"           # Bright Cyan
export COLOR_16="#F5F5F5"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#E4E4E4"   # Foreground (Text)

export CURSOR_COLOR="#FFDD33" # Cursor

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
