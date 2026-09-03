#!/usr/bin/env bash

export PROFILE_NAME="Aura Dark"

export COLOR_01="#15141B"           # Black (Host)
export COLOR_02="#FF6767"           # Red (Syntax string)
export COLOR_03="#61FFCA"           # Green (Command)
export COLOR_04="#FFCA85"           # Yellow (Command second)
export COLOR_05="#A277FF"           # Blue (Path)
export COLOR_06="#61FFCA"           # Magenta (Syntax var)
export COLOR_07="#A277FF"           # Cyan (Prompt)
export COLOR_08="#CDCCCE"           # White

export COLOR_09="#464646"           # Bright Black
export COLOR_10="#FFCA85"           # Bright Red (Command error)
export COLOR_11="#A277FF"           # Bright Green (Exec)
export COLOR_12="#FFCA85"           # Bright Yellow
export COLOR_13="#A277FF"           # Bright Blue (Folder)
export COLOR_14="#61FFCA"           # Bright Magenta
export COLOR_15="#61FFCA"           # Bright Cyan
export COLOR_16="#EDECEE"           # Bright White

export BACKGROUND_COLOR="#15141B"   # Background
export FOREGROUND_COLOR="#CDCCCE"   # Foreground (Text)

export CURSOR_COLOR="#A277FF" # Cursor

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
