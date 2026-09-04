#!/usr/bin/env bash

export PROFILE_NAME="Penumbra Light Contrast Plus Plus"

export COLOR_01="#FFFDFB"           # Black (Host)
export COLOR_02="#F58C81"           # Red (Syntax string)
export COLOR_03="#54C794"           # Green (Command)
export COLOR_04="#A9B852"           # Yellow (Command second)
export COLOR_05="#6EB2FD"           # Blue (Path)
export COLOR_06="#B69CF6"           # Magenta (Syntax var)
export COLOR_07="#00C4D7"           # Cyan (Prompt)
export COLOR_08="#636363"           # White

export COLOR_09="#DEDEDE"           # Bright Black
export COLOR_10="#F58C81"           # Bright Red (Command error)
export COLOR_11="#54C794"           # Bright Green (Exec)
export COLOR_12="#A9B852"           # Bright Yellow
export COLOR_13="#6EB2FD"           # Bright Blue (Folder)
export COLOR_14="#B69CF6"           # Bright Magenta
export COLOR_15="#00C4D7"           # Bright Cyan
export COLOR_16="#0D0F13"           # Bright White

export BACKGROUND_COLOR="#FFFDFB"   # Background
export FOREGROUND_COLOR="#636363"   # Foreground (Text)

export CURSOR_COLOR="#636363" # Cursor

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
