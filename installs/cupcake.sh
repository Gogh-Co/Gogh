#!/usr/bin/env bash

export PROFILE_NAME="Cupcake"

export COLOR_01="#FBF1F2"           # Black (Host)
export COLOR_02="#D57E85"           # Red (Syntax string)
export COLOR_03="#A3B367"           # Green (Command)
export COLOR_04="#DCB16C"           # Yellow (Command second)
export COLOR_05="#7297B9"           # Blue (Path)
export COLOR_06="#BB99B4"           # Magenta (Syntax var)
export COLOR_07="#69A9A7"           # Cyan (Prompt)
export COLOR_08="#8B8198"           # White

export COLOR_09="#BFB9C6"           # Bright Black
export COLOR_10="#D57E85"           # Bright Red (Command error)
export COLOR_11="#A3B367"           # Bright Green (Exec)
export COLOR_12="#DCB16C"           # Bright Yellow
export COLOR_13="#7297B9"           # Bright Blue (Folder)
export COLOR_14="#BB99B4"           # Bright Magenta
export COLOR_15="#69A9A7"           # Bright Cyan
export COLOR_16="#585062"           # Bright White

export BACKGROUND_COLOR="#FBF1F2"   # Background
export FOREGROUND_COLOR="#8B8198"   # Foreground (Text)

export CURSOR_COLOR="#8B8198" # Cursor

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
