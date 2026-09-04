#!/usr/bin/env bash

export PROFILE_NAME="Arroz Con Dulce Dark"

export COLOR_01="#21140F"           # Black (Host)
export COLOR_02="#E07A8A"           # Red (Syntax string)
export COLOR_03="#D47A50"           # Green (Command)
export COLOR_04="#D9A441"           # Yellow (Command second)
export COLOR_05="#B99AC8"           # Blue (Path)
export COLOR_06="#D58AB4"           # Magenta (Syntax var)
export COLOR_07="#D98276"           # Cyan (Prompt)
export COLOR_08="#F2DFC0"           # White

export COLOR_09="#A98568"           # Bright Black
export COLOR_10="#E07A8A"           # Bright Red (Command error)
export COLOR_11="#D47A50"           # Bright Green (Exec)
export COLOR_12="#D9A441"           # Bright Yellow
export COLOR_13="#B99AC8"           # Bright Blue (Folder)
export COLOR_14="#D58AB4"           # Bright Magenta
export COLOR_15="#D98276"           # Bright Cyan
export COLOR_16="#FFF8E7"           # Bright White

export BACKGROUND_COLOR="#21140F"   # Background
export FOREGROUND_COLOR="#F2DFC0"   # Foreground (Text)

export CURSOR_COLOR="#F2DFC0" # Cursor

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
