#!/usr/bin/env bash

export PROFILE_NAME="Tempus Day"

export COLOR_01="#464340"           # Black (Host)
export COLOR_02="#c81000"           # Red (Syntax string)
export COLOR_03="#107410"           # Green (Command)
export COLOR_04="#806000"           # Yellow (Command second)
export COLOR_05="#385dc4"           # Blue (Path)
export COLOR_06="#b63052"           # Magenta (Syntax var)
export COLOR_07="#007070"           # Cyan (Prompt)
export COLOR_08="#e7e3d7"           # White

export COLOR_09="#68607d"           # Bright Black
export COLOR_10="#b24000"           # Bright Red (Command error)
export COLOR_11="#427040"           # Bright Green (Exec)
export COLOR_12="#6f6600"           # Bright Yellow
export COLOR_13="#0f64c4"           # Bright Blue (Folder)
export COLOR_14="#8050a7"           # Bright Magenta
export COLOR_15="#336c87"           # Bright Cyan
export COLOR_16="#f8f2e5"           # Bright White

export BACKGROUND_COLOR="#f8f2e5"   # Background
export FOREGROUND_COLOR="#464340"   # Foreground (Text)

export CURSOR_COLOR="#464340" # Cursor

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
