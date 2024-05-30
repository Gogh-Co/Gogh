#!/usr/bin/env bash

export PROFILE_NAME="Gooey"

export COLOR_01="#000009"           # Black (Host)
export COLOR_02="#BB4F6C"           # Red (Syntax string)
export COLOR_03="#72CCAE"           # Green (Command)
export COLOR_04="#C65E3D"           # Yellow (Command second)
export COLOR_05="#58B6CA"           # Blue (Path)
export COLOR_06="#6488C4"           # Magenta (Syntax var)
export COLOR_07="#8D84C6"           # Cyan (Prompt)
export COLOR_08="#858893"           # White

export COLOR_09="#1F222D"           # Bright Black
export COLOR_10="#EE829F"           # Bright Red (Command error)
export COLOR_11="#A5FFE1"           # Bright Green (Exec)
export COLOR_12="#F99170"           # Bright Yellow
export COLOR_13="#8BE9FD"           # Bright Blue (Folder)
export COLOR_14="#97BBF7"           # Bright Magenta
export COLOR_15="#C0B7F9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D101B"   # Background
export FOREGROUND_COLOR="#EBEEF9"   # Foreground (Text)

export CURSOR_COLOR="#EBEEF9" # Cursor

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
