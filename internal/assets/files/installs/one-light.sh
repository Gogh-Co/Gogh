#!/usr/bin/env bash

export PROFILE_NAME="One Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DA3E39"           # Red (Syntax string)
export COLOR_03="#41933E"           # Green (Command)
export COLOR_04="#855504"           # Yellow (Command second)
export COLOR_05="#315EEE"           # Blue (Path)
export COLOR_06="#930092"           # Magenta (Syntax var)
export COLOR_07="#0E6FAD"           # Cyan (Prompt)
export COLOR_08="#8E8F96"           # White

export COLOR_09="#2A2B32"           # Bright Black
export COLOR_10="#DA3E39"           # Bright Red (Command error)
export COLOR_11="#41933E"           # Bright Green (Exec)
export COLOR_12="#855504"           # Bright Yellow
export COLOR_13="#315EEE"           # Bright Blue (Folder)
export COLOR_14="#930092"           # Bright Magenta
export COLOR_15="#0E6FAD"           # Bright Cyan
export COLOR_16="#FFFEFE"           # Bright White

export BACKGROUND_COLOR="#F8F8F8"   # Background
export FOREGROUND_COLOR="#2A2B32"   # Foreground (Text)

export CURSOR_COLOR="#2A2B32" # Cursor

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
