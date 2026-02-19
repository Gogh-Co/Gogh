#!/usr/bin/env bash

export PROFILE_NAME="Lunaria Light"

export COLOR_01="#3E3C3D"           # Black (Host)
export COLOR_02="#783C1F"           # Red (Syntax string)
export COLOR_03="#497D46"           # Green (Command)
export COLOR_04="#8F750B"           # Yellow (Command second)
export COLOR_05="#3F3566"           # Blue (Path)
export COLOR_06="#793F62"           # Magenta (Syntax var)
export COLOR_07="#3778A9"           # Cyan (Prompt)
export COLOR_08="#D5CFCC"           # White

export COLOR_09="#484646"           # Bright Black
export COLOR_10="#B06240"           # Bright Red (Command error)
export COLOR_11="#7BC175"           # Bright Green (Exec)
export COLOR_12="#DCB735"           # Bright Yellow
export COLOR_13="#5C4F89"           # Bright Blue (Folder)
export COLOR_14="#B56895"           # Bright Magenta
export COLOR_15="#64BAFF"           # Bright Cyan
export COLOR_16="#EBE4E1"           # Bright White

export BACKGROUND_COLOR="#EBE4E1"   # Background
export FOREGROUND_COLOR="#484646"   # Foreground (Text)

export CURSOR_COLOR="#484646" # Cursor

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
