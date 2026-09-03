#!/usr/bin/env bash

export PROFILE_NAME="Dayfox"

export COLOR_01="#352C24"           # Black (Host)
export COLOR_02="#A5222F"           # Red (Syntax string)
export COLOR_03="#396847"           # Green (Command)
export COLOR_04="#AC5402"           # Yellow (Command second)
export COLOR_05="#2848A9"           # Blue (Path)
export COLOR_06="#6E33CE"           # Magenta (Syntax var)
export COLOR_07="#287980"           # Cyan (Prompt)
export COLOR_08="#F2E9E1"           # White

export COLOR_09="#534C45"           # Bright Black
export COLOR_10="#B3434E"           # Bright Red (Command error)
export COLOR_11="#577F63"           # Bright Green (Exec)
export COLOR_12="#B86E28"           # Bright Yellow
export COLOR_13="#4863B6"           # Bright Blue (Folder)
export COLOR_14="#8452D5"           # Bright Magenta
export COLOR_15="#488D93"           # Bright Cyan
export COLOR_16="#F4ECE6"           # Bright White

export BACKGROUND_COLOR="#F6F2EE"   # Background
export FOREGROUND_COLOR="#3D2B5A"   # Foreground (Text)

export CURSOR_COLOR="#3D2B5A" # Cursor

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
