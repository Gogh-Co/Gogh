#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Garden"

export COLOR_01="#1E1F1E"           # Black (Host)
export COLOR_02="#3FAC39"           # Red (Syntax string)
export COLOR_03="#DB9257"           # Green (Command)
export COLOR_04="#E0CAB8"           # Yellow (Command second)
export COLOR_05="#4CB946"           # Blue (Path)
export COLOR_06="#DB9257"           # Magenta (Syntax var)
export COLOR_07="#6BCC66"           # Cyan (Prompt)
export COLOR_08="#969C96"           # White

export COLOR_09="#5D605C"           # Bright Black
export COLOR_10="#DBA070"           # Bright Red (Command error)
export COLOR_11="#2B2C2A"           # Bright Green (Exec)
export COLOR_12="#505350"           # Bright Yellow
export COLOR_13="#696D69"           # Bright Blue (Folder)
export COLOR_14="#B7E3B5"           # Bright Magenta
export COLOR_15="#DD843C"           # Bright Cyan
export COLOR_16="#DCF0DB"           # Bright White

export BACKGROUND_COLOR="#1E1F1E"   # Background
export FOREGROUND_COLOR="#969C96"   # Foreground (Text)

export CURSOR_COLOR="#BD5D0F" # Cursor

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
