#!/usr/bin/env bash

export PROFILE_NAME="Mar"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B5407B"           # Red (Syntax string)
export COLOR_03="#7BB540"           # Green (Command)
export COLOR_04="#B57B40"           # Yellow (Command second)
export COLOR_05="#407BB5"           # Blue (Path)
export COLOR_06="#7B40B5"           # Magenta (Syntax var)
export COLOR_07="#40B57B"           # Cyan (Prompt)
export COLOR_08="#F8F8F8"           # White

export COLOR_09="#737373"           # Bright Black
export COLOR_10="#CD73A0"           # Bright Red (Command error)
export COLOR_11="#A0CD73"           # Bright Green (Exec)
export COLOR_12="#CDA073"           # Bright Yellow
export COLOR_13="#73A0CD"           # Bright Blue (Folder)
export COLOR_14="#A073CD"           # Bright Magenta
export COLOR_15="#73CDA0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#23476A"   # Foreground (Text)

export CURSOR_COLOR="#23476A" # Cursor

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
