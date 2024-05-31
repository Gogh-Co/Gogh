#!/usr/bin/env bash

export PROFILE_NAME="Nightlion V2"

export COLOR_01="#4C4C4C"           # Black (Host)
export COLOR_02="#BB0000"           # Red (Syntax string)
export COLOR_03="#04F623"           # Green (Command)
export COLOR_04="#F3F167"           # Yellow (Command second)
export COLOR_05="#64D0F0"           # Blue (Path)
export COLOR_06="#CE6FDB"           # Magenta (Syntax var)
export COLOR_07="#00DADF"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF5555"           # Bright Red (Command error)
export COLOR_11="#7DF71D"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#62CBE8"           # Bright Blue (Folder)
export COLOR_14="#FF9BF5"           # Bright Magenta
export COLOR_15="#00CCD8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#171717"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
