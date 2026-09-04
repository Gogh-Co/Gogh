#!/usr/bin/env bash

export PROFILE_NAME="Konsole Linux"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B21818"           # Red (Syntax string)
export COLOR_03="#18B218"           # Green (Command)
export COLOR_04="#B26818"           # Yellow (Command second)
export COLOR_05="#1818B2"           # Blue (Path)
export COLOR_06="#B218B2"           # Magenta (Syntax var)
export COLOR_07="#18B2B2"           # Cyan (Prompt)
export COLOR_08="#B2B2B2"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#FF5454"           # Bright Red (Command error)
export COLOR_11="#54FF54"           # Bright Green (Exec)
export COLOR_12="#FFFF54"           # Bright Yellow
export COLOR_13="#5454FF"           # Bright Blue (Folder)
export COLOR_14="#FF54FF"           # Bright Magenta
export COLOR_15="#54FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1F1F1F"   # Background
export FOREGROUND_COLOR="#E3E3E3"   # Foreground (Text)

export CURSOR_COLOR="#E3E3E3" # Cursor

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
