#!/usr/bin/env bash

export PROFILE_NAME="Hachiko Red"

export COLOR_01="#181818"           # Black (Host)
export COLOR_02="#960042"           # Red (Syntax string)
export COLOR_03="#FF0000"           # Green (Command)
export COLOR_04="#FF5D05"           # Yellow (Command second)
export COLOR_05="#FF2044"           # Blue (Path)
export COLOR_06="#FFEDCF"           # Magenta (Syntax var)
export COLOR_07="#6F0027"           # Cyan (Prompt)
export COLOR_08="#FFDAF1"           # White

export COLOR_09="#333333"           # Bright Black
export COLOR_10="#870300"           # Bright Red (Command error)
export COLOR_11="#690000"           # Bright Green (Exec)
export COLOR_12="#6F2700"           # Bright Yellow
export COLOR_13="#333333"           # Bright Blue (Folder)
export COLOR_14="#FFFFB5"           # Bright Magenta
export COLOR_15="#F50056"           # Bright Cyan
export COLOR_16="#FFE6DA"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#FFDAF1"   # Foreground (Text)

export CURSOR_COLOR="#FFDAF1" # Cursor

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
