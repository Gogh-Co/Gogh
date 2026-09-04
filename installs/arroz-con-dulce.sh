#!/usr/bin/env bash

export PROFILE_NAME="Arroz Con Dulce"

export COLOR_01="#FFF8E7"           # Black (Host)
export COLOR_02="#A11D48"           # Red (Syntax string)
export COLOR_03="#A2380C"           # Green (Command)
export COLOR_04="#855500"           # Yellow (Command second)
export COLOR_05="#5940A0"           # Blue (Path)
export COLOR_06="#8C1F68"           # Magenta (Syntax var)
export COLOR_07="#98263E"           # Cyan (Prompt)
export COLOR_08="#4A2C20"           # White

export COLOR_09="#C8A77A"           # Bright Black
export COLOR_10="#A11D48"           # Bright Red (Command error)
export COLOR_11="#A2380C"           # Bright Green (Exec)
export COLOR_12="#855500"           # Bright Yellow
export COLOR_13="#5940A0"           # Bright Blue (Folder)
export COLOR_14="#8C1F68"           # Bright Magenta
export COLOR_15="#98263E"           # Bright Cyan
export COLOR_16="#21110B"           # Bright White

export BACKGROUND_COLOR="#FFF8E7"   # Background
export FOREGROUND_COLOR="#4A2C20"   # Foreground (Text)

export CURSOR_COLOR="#4A2C20" # Cursor

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
