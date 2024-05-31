#!/usr/bin/env bash

export PROFILE_NAME="Liquid Carbon"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF3030"           # Red (Syntax string)
export COLOR_03="#559A70"           # Green (Command)
export COLOR_04="#CCAC00"           # Yellow (Command second)
export COLOR_05="#0099CC"           # Blue (Path)
export COLOR_06="#CC69C8"           # Magenta (Syntax var)
export COLOR_07="#7AC4CC"           # Cyan (Prompt)
export COLOR_08="#BCCCCC"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF3030"           # Bright Red (Command error)
export COLOR_11="#559A70"           # Bright Green (Exec)
export COLOR_12="#CCAC00"           # Bright Yellow
export COLOR_13="#0099CC"           # Bright Blue (Folder)
export COLOR_14="#CC69C8"           # Bright Magenta
export COLOR_15="#7AC4CC"           # Bright Cyan
export COLOR_16="#BCCCCC"           # Bright White

export BACKGROUND_COLOR="#303030"   # Background
export FOREGROUND_COLOR="#AFC2C2"   # Foreground (Text)

export CURSOR_COLOR="#AFC2C2" # Cursor

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
