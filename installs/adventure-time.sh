#!/usr/bin/env bash

export PROFILE_NAME="Adventure Time"

export COLOR_01="#050404"           # Black (Host)
export COLOR_02="#BD0013"           # Red (Syntax string)
export COLOR_03="#4AB118"           # Green (Command)
export COLOR_04="#E7741E"           # Yellow (Command second)
export COLOR_05="#0F4AC6"           # Blue (Path)
export COLOR_06="#665993"           # Magenta (Syntax var)
export COLOR_07="#70A598"           # Cyan (Prompt)
export COLOR_08="#F8DCC0"           # White

export COLOR_09="#4E7CBF"           # Bright Black
export COLOR_10="#FC5F5A"           # Bright Red (Command error)
export COLOR_11="#9EFF6E"           # Bright Green (Exec)
export COLOR_12="#EFC11A"           # Bright Yellow
export COLOR_13="#1997C6"           # Bright Blue (Folder)
export COLOR_14="#9B5953"           # Bright Magenta
export COLOR_15="#C8FAF4"           # Bright Cyan
export COLOR_16="#F6F5FB"           # Bright White

export BACKGROUND_COLOR="#1F1D45"   # Background
export FOREGROUND_COLOR="#F8DCC0"   # Foreground (Text)

export CURSOR_COLOR="#F8DCC0" # Cursor

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
