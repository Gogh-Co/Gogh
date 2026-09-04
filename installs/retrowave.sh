#!/usr/bin/env bash

export PROFILE_NAME="Retrowave"

export COLOR_01="#181A1F"           # Black (Host)
export COLOR_02="#FF16B0"           # Red (Syntax string)
export COLOR_03="#929292"           # Green (Command)
export COLOR_04="#FCEE54"           # Yellow (Command second)
export COLOR_05="#46BDFF"           # Blue (Path)
export COLOR_06="#FF92DF"           # Magenta (Syntax var)
export COLOR_07="#DF81FC"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#FF16B0"           # Bright Black
export COLOR_10="#F85353"           # Bright Red (Command error)
export COLOR_11="#FCEE54"           # Bright Green (Exec)
export COLOR_12="#FFFFFF"           # Bright Yellow
export COLOR_13="#46BDFF"           # Bright Blue (Folder)
export COLOR_14="#FF92DF"           # Bright Magenta
export COLOR_15="#FF901F"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#070825"   # Background
export FOREGROUND_COLOR="#46BDFF"   # Foreground (Text)

export CURSOR_COLOR="#46BDFF" # Cursor

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
