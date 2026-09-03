#!/usr/bin/env bash

export PROFILE_NAME="Xcode WWDC"

export COLOR_01="#494D5C"           # Black (Host)
export COLOR_02="#BB383A"           # Red (Syntax string)
export COLOR_03="#94C66E"           # Green (Command)
export COLOR_04="#D28E5D"           # Yellow (Command second)
export COLOR_05="#8884C5"           # Blue (Path)
export COLOR_06="#B73999"           # Magenta (Syntax var)
export COLOR_07="#00ABA4"           # Cyan (Prompt)
export COLOR_08="#E7E8EB"           # White

export COLOR_09="#7F869E"           # Bright Black
export COLOR_10="#BB383A"           # Bright Red (Command error)
export COLOR_11="#94C66E"           # Bright Green (Exec)
export COLOR_12="#D28E5D"           # Bright Yellow
export COLOR_13="#8884C5"           # Bright Blue (Folder)
export COLOR_14="#B73999"           # Bright Magenta
export COLOR_15="#00ABA4"           # Bright Cyan
export COLOR_16="#E7E8EB"           # Bright White

export BACKGROUND_COLOR="#292C36"   # Background
export FOREGROUND_COLOR="#E7E8EB"   # Foreground (Text)

export CURSOR_COLOR="#E7E8EB" # Cursor

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
