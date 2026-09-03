#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic W"

export COLOR_01="#201D1E"           # Black (Host)
export COLOR_02="#B87305"           # Red (Syntax string)
export COLOR_03="#CA45DE"           # Green (Command)
export COLOR_04="#E17EF1"           # Yellow (Command second)
export COLOR_05="#EB75A2"           # Blue (Path)
export COLOR_06="#E97263"           # Magenta (Syntax var)
export COLOR_07="#D763E9"           # Cyan (Prompt)
export COLOR_08="#EDE8EA"           # White

export COLOR_09="#0D080A"           # Bright Black
export COLOR_10="#E6971A"           # Bright Red (Command error)
export COLOR_11="#E691F3"           # Bright Green (Exec)
export COLOR_12="#EDB1F6"           # Bright Yellow
export COLOR_13="#F8BFD5"           # Bright Blue (Folder)
export COLOR_14="#F18C7E"           # Bright Magenta
export COLOR_15="#F6B1CC"           # Bright Cyan
export COLOR_16="#F9F6F7"           # Bright White

export BACKGROUND_COLOR="#201D1E"   # Background
export FOREGROUND_COLOR="#9E9498"   # Foreground (Text)

export CURSOR_COLOR="#7F7481" # Cursor

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
